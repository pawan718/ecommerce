import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_text.dart';

class ProfileListComponent extends StatelessWidget {
  const ProfileListComponent({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 12),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: text, size: 16),
              SvgPicture.asset('images/arrowright2.svg')
            ],
          ),
        ),
      ),
    );
  }
}
