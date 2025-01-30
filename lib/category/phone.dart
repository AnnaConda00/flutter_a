import 'package:flutter/material.dart';
import '../widgets/product_adding.dart';
import '../widgets/product_card.dart';
import '../model/product.dart';
import '../widgets/bottom_menu.dart';

class CategoryPhone extends StatefulWidget {
  const CategoryPhone({Key? key}) : super(key: key);

  @override
  _CategoryPhoneState createState() => _CategoryPhoneState();
}

class _CategoryPhoneState extends State<CategoryPhone> {
  final ScrollController _scrollController = ScrollController();
  late ProductListLoader _productListLoader;
  List<Product> _products = [];
  final String _categoryTitle = 'Смартфоны';
  bool _menuVisible = false;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _productListLoader = ProductListLoader(
      itemsPerPage: 6,
      scrollController: _scrollController,
      onNewProductsLoaded: (products) {
        setState(() {
          _products = products;
        });
      },
      onLoadingStateChanged: (loading) {
        setState(() {
          _isLoading = loading;
        });
      },
      onMoreContentAvailable: (hasMore) {
        setState(() {
          _hasMore = hasMore;
        });
      },
      filterCondition: _filterCondition,
    );
    _productListLoader.initialize();
  }

  @override
  void dispose() {
    _productListLoader.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool _filterCondition(Product product) {
    return product.title.toLowerCase().contains('смартфон');
  }

  void _toggleMenu() {
    setState(() {
      _menuVisible = !_menuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
        body: Stack(
        children: [
        RefreshIndicator(
        onRefresh: () async {
      setState(() {
        _products.clear();
      });
      await _productListLoader.refreshProducts();
    },
    child: ListView.builder(
    controller: _scrollController,
    padding: const EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 80.0),
    itemCount: _products.length + (_hasMore ? 1 : 0),
    itemBuilder: (context, index) {
    if (index < _products.length) {
    final product = _products[index];
    return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ProductCard(product: product),
    );
    } else if (_isLoading) {
      return Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset('image/flower.gif'),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
    },
    ),
        ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 110,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Color(0xFFF48FB1),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset('image/phone.png',
                              width: 24, height: 24),
                          onPressed: _toggleMenu,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          _categoryTitle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontFamily: 'Poppins Regular'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 60,
              child: const BottomNavigationBarWidget(),
            ),
          ),
        ],
        ),
    );
  }
}