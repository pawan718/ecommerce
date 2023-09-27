import 'package:ecommerce/Screens/bloc/add_to_cart_bloc.dart';
import 'package:ecommerce/Screens/homepage/checkout_add_address_screen.dart';
import 'package:ecommerce/Screens/product_screens/empty_cart_screen.dart';
import 'package:ecommerce/Screens/product_screens/prodcut_details.dart';
import 'package:ecommerce/common_widgets/price_calculating_component.dart';
import 'package:ecommerce/common_widgets/two_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../common_widgets/app_bold_text.dart';
import '../../common_widgets/app_button.dart';
import '../../common_widgets/app_text.dart';
import '../../common_widgets/checkout_item_screen.dart';
import '../../common_widgets/top_back_button.dart';
import '../add_to_cart_Products_model.dart';
import '../homepage/no_order_screen.dart';

class CheckOut extends StatefulWidget {
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List<CheckoutItem> products = [];
  List<AddToCartProductModel> items = [];
  bool check = true;

  String totalprice = "0";
  String subtotal = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<AddToCartBloc, AddToCartState>(
      builder: (context, state) {
        if (state is AddtocartItemsLoading) {
          return const CircularProgressIndicator();
        } else if (state is ShoppincartState) {
          subtotal = "${state.totalPrice}";
          totalprice = "${state.totalPrice + 8}";
          items = state.addtocartproducts;
          products = state.addtocartproducts
              .map((e) => CheckoutItem(
                    onPlusButtonTap: () {
                      context
                          .read<AddToCartBloc>()
                          .add(IncreaseItem(itemname: e.productname));
                    },
                    onminusButtonTap: () {
                      context
                          .read<AddToCartBloc>()
                          .add(DecreaseItem(itemname: e.productname));
                    },
                    imageurl: e.picurl,
                    prodcutsize: e.productsize,
                    price: e.price,
                    productname: e.productname,
                    itemcount: e.itemcount,
                  ))
              .toList();
        }
        return items.isEmpty
            ? const EmptyScreen()
            : Scaffold(
                backgroundColor: const Color(0xFFF5F5F5),
                body: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const TopBackButton()),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: TwoTextWidget(
                                  onTap: () {
                                    context
                                        .read<AddToCartBloc>()
                                        .add(RemoveAllTaskFromCartEvent());
                                  },
                                  secondtext: 'Remove All',
                                  firsttext: 'Cart'),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children:
                                    List.generate(products.length, (index) {
                                  return products[index];
                                }),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            BlocBuilder<AddToCartBloc, AddToCartState>(
                              builder: (context, state) {
                                if (state is AddtoCartItemsLoadingDone) {
                                  totalprice =
                                      state.totolpriceofallitems.toString();
                                  int calculate =
                                      state.totolpriceofallitems - 8;
                                  subtotal = "$calculate";
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: PriceCalculatingComponent(
                                      subtotalprice: "\$$subtotal",
                                      shppingcost: '\$8',
                                      tax: '\$0.00',
                                      total: '\$$totalprice'),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 31,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, bottom: 16, left: 16),
                                      child: SvgPicture.asset(
                                          'images/discountshape.svg'),
                                    ),
                                    const Expanded(
                                      child: TextField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: 'Enter Coupan code',
                                            hintStyle: TextStyle(
                                                fontFamily: 'GT-Regular',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, right: 9, bottom: 8),
                                      child: SvgPicture.asset(
                                          'images/nextbutton.svg'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: items.isEmpty ? false : true,
                      child: BottomAppButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAddress(
                                        total: totalprice,
                                        subtotal: subtotal,
                                        items: items,
                                      )));
                        },
                        child: const SizedBox(
                            width: double.infinity,
                            child: Center(child: Text('Checkout'))),
                      ),
                    )
                  ],
                ),
              );
      },
    ));
  }
}
