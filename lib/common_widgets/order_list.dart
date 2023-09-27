import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_bold_text.dart';

class OrderandWishlistitemComponent extends StatelessWidget {
  const OrderandWishlistitemComponent(
      {super.key,
      this.ontap,
      required this.imagepath,
      required this.itemname,
      required this.itemcount});
  final GestureTapCallback? ontap;
  final String imagepath;

  final String itemname;
  final String itemcount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding:
              const EdgeInsets.only(top: 16, left: 12, bottom: 16, right: 9),
          color: Colors.white,
          child: Row(
            children: [
              SvgPicture.asset(
                imagepath,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 250,
                      child: AppBoldText(text: itemname, fontsize: 16)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    itemcount,
                    style: const TextStyle(
                        color: Color(0xff050505),
                        fontSize: 12,
                        fontFamily: 'GT-Regular',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset('images/arrowright2.svg')
            ],
          ),
        ),
      ),
    );
  }
}
