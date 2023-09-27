import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBackButton extends StatelessWidget {
  const TopBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 27),
          child: SvgPicture.asset('images/back_button.svg')),
    );
  }
}
