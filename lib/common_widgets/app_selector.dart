import 'package:flutter/material.dart';

class AppSelector extends StatelessWidget {
  const AppSelector(
      {super.key, required this.text, required this.child, this.onTap});
  final String text;
  final Widget child;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: 56,
          decoration: ShapeDecoration(
            color: Colors.white,
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
                  left: 16,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 16,
                    fontFamily: 'GT Walsheim Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
