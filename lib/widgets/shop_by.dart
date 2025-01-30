import 'package:flutter/material.dart';
import '../category/phone.dart';
import '../category/laptop.dart';
import '../category/tv.dart';

class ShopBy extends StatelessWidget {
  const ShopBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Категории',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins Regular',
          ),
        ),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildCategoryTile(
              context,
              'Телевизоры',
              CategoryTV(),
            ),
            _buildCategoryTile(
              context,
              'Телефоны',
              CategoryPhone(),
            ),
            _buildCategoryTile(
              context,
              'Ноутбуки',
              CategoryNotebooks(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryTile(
      BuildContext context, String title, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xFFF48FB1),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
