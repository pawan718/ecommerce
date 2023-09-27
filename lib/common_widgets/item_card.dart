import 'package:flutter/material.dart';

class Itemcard extends StatelessWidget {
  const Itemcard(
      {super.key,
      required this.imagepath,
      this.onTap,
      required this.productname,
      required this.productprice});
  final String imagepath;
  final String productname;
  final String productprice;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imagepath,
                    ),
                    width: 159,
                    height: 144,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 6, right: 8),
                    child: Text(
                      productname,
                      style: const TextStyle(
                          fontFamily: 'GT-Regular',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8, bottom: 18),
                    child: Text(
                      productprice,
                      style: const TextStyle(
                          color: Color(0xff9747FF),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          fontFamily: 'GT-Bold'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
