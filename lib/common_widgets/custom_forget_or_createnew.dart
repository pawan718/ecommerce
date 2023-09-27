import 'package:flutter/material.dart';

class CustomForgetorCreatenew extends StatelessWidget {
  const CustomForgetorCreatenew(
      {super.key,
      required this.firsttext,
      required this.secondtext,
      this.onTap});
  final String firsttext;
  final String secondtext;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23, top: 12),
      child: Row(
        children: [
          Text(
            firsttext,
            style: TextStyle(
                fontFamily: 'GT-Regular',
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              secondtext,
              style: TextStyle(
                  fontFamily: 'GT-Bold',
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
