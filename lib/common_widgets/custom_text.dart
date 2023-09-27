import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 88, left: 27),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'GT-Bold', fontSize: 32, fontWeight: FontWeight.w700),
      ),
    );
  }
}
