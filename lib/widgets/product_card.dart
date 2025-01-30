import 'package:flutter/material.dart';
import '../model/product.dart';
import '../product/product_continus.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Product1(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(width: 10),
              product.imageUrl != null
                  ? Container(
                      width: 120,
                      height: 90,
                      child: Image.network(
                        product.imageUrl!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : const Icon(Icons.image, size: 50),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins Regular'
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${product.price} руб.',
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins Medium'
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}