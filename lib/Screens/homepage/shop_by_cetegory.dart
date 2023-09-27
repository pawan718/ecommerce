import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common_widgets/shop_by_cetegory_card.dart';
import '../profile/my_favorite.dart';

class ShopByCetegory extends StatelessWidget {
  const ShopByCetegory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, left: 3, bottom: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('images/back_button.svg')),
            ),
            const Text(
              'Shop by Cetegories',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: 'GT-Regular'),
            ),
            const SizedBox(
              height: 16,
            ),
            ShopByCetegoryCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myfavorite(
                              cetegeorytype: 'Cloothing',
                              id: '1',
                            )));
              },
              text: 'Clothing',
              imagepath: 'images/Ellipse 1.png',
            ),
            const SizedBox(
              height: 8,
            ),
            ShopByCetegoryCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myfavorite(
                              cetegeorytype: 'Accessories',
                              id: '2',
                            )));
              },
              text: 'Accesories',
              imagepath: 'images/Ellipse 1.png',
            ),
            const SizedBox(
              height: 8,
            ),
            ShopByCetegoryCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myfavorite(
                              cetegeorytype: 'Beauty',
                              id: '3',
                            )));
              },
              text: 'Beauty',
              imagepath: 'images/Ellipse 1.png',
            ),
            const SizedBox(
              height: 8,
            ),
            ShopByCetegoryCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myfavorite(
                              cetegeorytype: 'Shoes',
                              id: '4',
                            )));
              },
              text: 'Shoes',
              imagepath: 'images/Ellipse 1.png',
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    ));
  }
}
