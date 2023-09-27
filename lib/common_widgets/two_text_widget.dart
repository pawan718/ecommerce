import 'package:flutter/material.dart';

class TwoTextWidget extends StatelessWidget {
  const TwoTextWidget(
      {super.key,
      required this.secondtext,
      required this.firsttext,
      this.onTap});

  final String firsttext;
  final String secondtext;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firsttext,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 24, fontFamily: 'GT-Bold'),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            secondtext,
            style: TextStyle(
              fontFamily: 'GT-Regular',
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
