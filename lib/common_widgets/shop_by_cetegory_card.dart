import 'package:flutter/material.dart';

class ShopByCetegoryCard extends StatelessWidget {
  const ShopByCetegoryCard(
      {super.key, required this.text, required this.imagepath, this.onTap});
  final String imagepath;
  final String text;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, bottom: 12),
              child: Image(
                image: AssetImage(imagepath),
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              width: 21,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'GT-Regular'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
