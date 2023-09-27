import 'package:ecommerce/Screens/bloc/add_to_cart_bloc.dart';
import 'package:ecommerce/Screens/bloc/order_place_bloc.dart';
import 'package:ecommerce/Screens/homepage/home_screen.dart';
import 'package:ecommerce/Screens/product_screens/checkout_screen.dart';
import 'package:ecommerce/Screens/product_screens/order_successfully_placed_screen.dart';
import 'package:ecommerce/Screens/product_screens/prodcut_details.dart';
import 'package:ecommerce/Screens/profile/edit_address.dart';
import 'package:ecommerce/common_widgets/app_bold_text.dart';
import 'package:ecommerce/common_widgets/app_text.dart';
import 'package:ecommerce/common_widgets/price_calculating_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uuid/uuid.dart';

import '../../common_widgets/top_back_button.dart';
import '../add_to_cart_Products_model.dart';

class AddAddress extends StatefulWidget {
  AddAddress({
    super.key,
    required this.total,
    required this.items,
    required this.subtotal,
  });

  final String total;
  final String subtotal;
  List<AddToCartProductModel> items;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  String result = "";
  Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const TopBackButton()),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24),
              child: AppBoldText(text: 'Checkout', fontsize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 27),
              child: GestureDetector(
                onTap: () async {
                  result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditAddress()));
                  setState(() {
                    result = result;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 12, left: 12, bottom: 17, right: 9),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add Address here',
                            style: TextStyle(
                              color: Color(0x7F050505),
                              fontSize: 12,
                              fontFamily: 'GT Walsheim Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                              width: 280,
                              child: AppText(
                                  text: result == ""
                                      ? "Add Shipping Address"
                                      : result,
                                  size: 16)),
                        ],
                      ),
                      SvgPicture.asset('images/arrowright2.svg'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PriceCalculatingComponent(
                subtotalprice: widget.subtotal,
                shppingcost: '\$8',
                tax: '\$0.00',
                total: widget.total),
          ),
        ),
        BlocListener<OrderPlaceBloc, OrderPlaceState>(
          listener: (context, state) {
            if (state is OrderSuccessfullyPlace) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderSuccessfullyPlaced()));
            }
          },
          child: BottomAppButton(
            onPressed: () {
              context.read<OrderPlaceBloc>().add(OrderPlace(
                  orders: widget.items,
                  itemcount: "${widget.items.length}",
                  orderstatus: 'Order Placed',
                  orderamount: widget.total,
                  orderdate: DateTime.now().toString(),
                  orderid: uuid.v4(),
                  shippingAddress: result));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      widget.total,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'GT Walsheim Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'GT Walsheim Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
