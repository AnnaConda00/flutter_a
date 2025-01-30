import 'package:flutter/material.dart';
import '../pages/main_activity.dart';
import '../category/tv.dart';
import '../category/laptop.dart';
import '../category/phone.dart';
class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Color(0xFFF48FB1),
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset('image/home.png', width: 43, color:  Color(
                  0xFFFFFFFF)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainActivity()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('image/phone.png', width: 43),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryPhone()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('image/laptop.png', width: 43),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryNotebooks()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('image/tv.png', width: 43),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryTV()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}