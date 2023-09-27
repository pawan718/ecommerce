import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_bold_text.dart';

class RatingComponent extends StatelessWidget {
  const RatingComponent({
    super.key,
    required this.personname,
    required this.profilepicurl,
    required this.description,
    required this.time,
  });
  final String personname;
  final String profilepicurl;
  final String description;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset(profilepicurl),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  AppBoldText(text: personname, fontsize: 12)
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return index < 3
                      ? SvgPicture.asset(
                          'images/filledstar.svg',
                          height: 16,
                          width: 16,
                        )
                      : SvgPicture.asset(
                          'images/emptystar.svg',
                          height: 16,
                          width: 16,
                        );
                }),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            description,
            style: const TextStyle(
              color: Color(0x7F050505),
              fontSize: 12,
              fontFamily: 'GT-Regular',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            time,
            style: const TextStyle(
              color: Color(0xFF050505),
              fontSize: 12,
              fontFamily: 'GT-Regular',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
