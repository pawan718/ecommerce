import 'package:flutter/material.dart';

class AppBoldText extends StatelessWidget {
  const AppBoldText(
      {super.key, required this.text, required this.fontsize, this.color});
  final String text;
  final double fontsize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w700,
        fontFamily: 'GT-Bold',
        color: color,
      ),
    );
  }
}
