import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_bold_text.dart';
import 'app_text.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({
    super.key,
    required this.imageurl,
    required this.itemcount,
    required this.prodcutsize,
    required this.price,
    this.onminusButtonTap,
    this.onPlusButtonTap,
    required this.productname,
  });
  final String imageurl;
  final String prodcutsize;
  final String price;
  final String productname;
  final int itemcount;
  final GestureTapCallback? onPlusButtonTap;
  final GestureTapCallback? onminusButtonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        top: 4,
                        bottom: 4,
                      ),
                      child: Stack(children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          child: Image.network(
                            imageurl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                            top: 4,
                            left: 4,
                            child: SvgPicture.asset('images/false.svg'))
                      ]),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: productname, size: 12),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Size',
                              style: TextStyle(
                                color: Color(0x7F050505),
                                fontSize: 12,
                                fontFamily: 'GT Walsheim Pro',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppBoldText(text: '-', fontsize: 12),
                            SizedBox(
                              width: 5,
                            ),
                            AppBoldText(text: prodcutsize, fontsize: 12)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Text(
                    price,
                    style: TextStyle(
                      color: Color(0xFF9747FF),
                      fontSize: 12,
                      fontFamily: 'GT-Bold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onPlusButtonTap,
                      child: SvgPicture.asset(
                        'images/plusbutton.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("$itemcount"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: onminusButtonTap,
                        child: SvgPicture.asset(
                          'images/minusbutton.svg',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
