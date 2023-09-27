import 'package:flutter/material.dart';

class ProductSizeSelector extends StatelessWidget {
  const ProductSizeSelector(
      {super.key,
      this.child,
      this.onTap,
      required this.size,
      this.color,
      this.textcolor});
  final Color? color;
  final String size;
  final Widget? child;
  final GestureTapCallback? onTap;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
        child: Container(
          height: 56,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  bottom: 20,
                  left: 34,
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 16,
                    fontFamily: 'GT Walsheim Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, right: 22, bottom: 14),
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
