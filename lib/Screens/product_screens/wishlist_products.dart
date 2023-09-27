import 'package:ecommerce/Screens/bloc/wish_list_bloc.dart';
import 'package:ecommerce/Screens/profile/profile_section.dart';
import 'package:ecommerce/common_widgets/app_bold_text.dart';
import 'package:ecommerce/common_widgets/top_back_button.dart';
import 'package:ecommerce/Screens/bloc/ShoppingItemsBloc/shopping_iitems_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../common_widgets/cetegory_type_shimmer.dart';
import '../../common_widgets/item_card.dart';
import '../product_screens/prodcut_details.dart';

class WishListProductsScreen extends StatefulWidget {
  const WishListProductsScreen({
    super.key,
  });
  @override
  State<WishListProductsScreen> createState() => _WishListProductsScreenState();
}

class _WishListProductsScreenState extends State<WishListProductsScreen> {
  @override
  void initState() {
    context.read<WishListBloc>().add(FetchWishListProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const TopBackButton()),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 24),
            child: AppBoldText(text: "WishList Products", fontsize: 24),
          ),
          BlocBuilder<WishListBloc, WishListState>(
            builder: (context, state) {
              List<Itemcard> itemCards = [];
              if (state is WishlistProductsLoading) {
                return const CetegoryTypeShimmer();
              } else if (state is WishlistProductsSuccessfullyLoaded) {
                itemCards = state.wishlistproducts
                    .map((e) => Itemcard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                        uid: e.docid,
                                      )));
                        },
                        imagepath: e.producturl,
                        productname: e.productname,
                        productprice: ''))
                    .toList();
              }
              return Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: itemCards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.90,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 25, top: 13),
                      child: itemCards[index],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
