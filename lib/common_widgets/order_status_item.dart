import 'package:flutter/material.dart';

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem(
      {super.key,
      required this.text,
      this.color,
      this.textcolor,
      this.onTap,
      required this.padding});
  final String text;
  final Color? color;
  final Color? textcolor;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: color),
          child: Text(
            text,
            style: TextStyle(
                color: textcolor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'GT-Regular'),
          ),
        ),
      ),
    );
  }
}
