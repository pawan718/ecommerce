import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key,
    required this.pricecetegory,
    required this.price,
    required this.fontfamily,
    required this.fontfamily2,
  });

  final String pricecetegory;
  final String price;
  final String fontfamily;
  final String fontfamily2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pricecetegory,
            style: TextStyle(
              color: const Color(0x7F050505),
              fontSize: 16,
              fontFamily: fontfamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            price,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFF050505),
              fontSize: 16,
              fontFamily: fontfamily2,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
