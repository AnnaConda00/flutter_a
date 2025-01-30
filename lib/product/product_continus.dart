import 'package:flutter/material.dart';
import '../model/product.dart';
import '../widgets/bottom_menu.dart';

class Product1 extends StatefulWidget {
  final Product product;

  Product1({Key? key, required this.product}) : super(key: key);

  @override
  _Product1State createState() => _Product1State();
}

class _Product1State extends State<Product1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCE4EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF48FB1),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  SizedBox(
                    width: 343.0,
                    height: 250.0,
                    child: Image.network(
                      widget.product.imageUrl ??
                          'https://i.ibb.co/4dr0v9x/no-image.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0x42FF6699),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                              fontSize: 21.0,
                              color: Colors.black,
                              fontFamily: 'Poppins Bold'),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          widget.product.productDescription,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'Poppins Regular'),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          '${widget.product.price} руб.',
                          style: const TextStyle(
                              fontSize: 21.0,
                              color: Colors.black,
                              fontFamily: 'Poppins Medium'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          const BottomNavigationBarWidget(),
        ],
      ),
    );
  }
}

