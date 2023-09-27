import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.text, required this.size});
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontFamily: 'GT-Regular',
          color: Color(0xFF050505),
          fontWeight: FontWeight.w400),
    );
  }
}
