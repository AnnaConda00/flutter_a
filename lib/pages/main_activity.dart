import 'package:flutter/material.dart';
import '../apps/api.dart';
import '../model/product.dart';
import '../widgets/logo.dart';
import '../product/product_continus.dart';
import '../widgets/bottom_menu.dart';
import '../widgets/shop_by.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  bool _isMenuVisible = false;
  late Future<List<Product>> _productDataFuture;
  List<Product>? _best;

  @override
  void initState() {
    super.initState();
    _productDataFuture = ApiService().fetchProductDetails();
    _loadData();
  }

  Future<void> _loadData() async {
    final products = await _productDataFuture;
    products.shuffle();
    final half = (products.length ~/ 2);
    _best = products.sublist(half);

    setState(() {});
  }

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBar(),
                  const SizedBox(height: 20),
                  const ShopBy(),
                  const SizedBox(height: 20),
                  if (_best != null) _buildGridList(),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Пример для проверки',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 60,
              child:  const BottomNavigationBarWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Logo(),

        ],
      ),
    );
  }


  Widget _buildGridList() {
    if (_best == null || _best!.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        const Text(
          'Наши предложения',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins Regular'),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _best!.length,
              itemBuilder: (context, index) {
                final product = _best![index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product1(product: product)),
                      );
                    },
                    child: Container(
                      width: 182,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8.0)),
                                child: Image.network(
                                  product.imageUrl ?? '',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins Regular'),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '${product.price} руб.',
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Color.fromARGB(255, 80, 45, 62),
                                      fontFamily: 'Poppins Medium'),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8)
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}