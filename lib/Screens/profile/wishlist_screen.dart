import 'package:ecommerce/Screens/bloc/wish_list_bloc.dart';
import 'package:ecommerce/Screens/product_screens/wishlist_products.dart';
import 'package:ecommerce/Screens/profile/my_favorite.dart';
import 'package:ecommerce/common_widgets/app_bold_text.dart';
import 'package:ecommerce/common_widgets/order_list.dart';
import 'package:ecommerce/common_widgets/top_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishList extends StatefulWidget {
  WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int count = 4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const TopBackButton()),
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 24, bottom: 28),
            child: AppBoldText(text: 'Wishlist', fontsize: 24),
          ),
          OrderandWishlistitemComponent(
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WishListProductsScreen()));
              },
              imagepath: 'images/filledheart.svg',
              itemname: 'My favorite',
              itemcount: '$count poducts'),
        ],
      ),
    ));
  }
}
