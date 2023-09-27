import 'package:ecommerce/Screens/bloc/UserDetailsBloc/user_details_bloc.dart';
import 'package:ecommerce/Screens/bloc/order_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_stepper/stepper.dart';
import 'package:order_tracker/order_tracker.dart';

import '../../common_widgets/app_bold_text.dart';
import '../../order_details_data_model.dart';

class OrderTracking extends StatelessWidget {
  String status = "Order Placed";
  OrderTrackingDataModel orders = OrderTrackingDataModel(
      id: '', orderid: '', itemcount: '', orderstatus: '', shippingaddress: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<OrderTrackingDetailsBloc, OrderDetailsState>(
        builder: (context, state) {
          if (state is OrderTrackingDetailsLoading) {
            return const CircularProgressIndicator();
          } else if (state is OrderTrackingDetailsLoadingDone) {
            orders = state.orders;
            status = state.orders.orderstatus;
          }
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28, left: 3, bottom: 16),
                    child: SvgPicture.asset('images/back_button.svg'),
                  ),
                  AppBoldText(text: 'Order  #${orders.orderid}', fontsize: 24),
                  const SizedBox(
                    height: 32,
                  ),
                  OrderTracker(
                    status: status == "Order Placed"
                        ? Status.order
                        : status == "shipped"
                            ? Status.shipped
                            : status == "OutofDelivery"
                                ? Status.outOfDelivery
                                : Status.delivered,
                    activeColor: const Color(0xff9747FF),
                    inActiveColor: const Color(0xffE5D8F6),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const AppBoldText(text: 'Order items', fontsize: 16),
                  const SizedBox(
                    height: 17,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 12, right: 20),
                    color: Colors.white,
                    child: Row(
                      children: [
                        SvgPicture.asset('images/ordericon.svg'),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '${orders.itemcount} itmes',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'GT-Regular'),
                        ),
                        const Spacer(),
                        const Text(
                          'View All',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'GT--Bold',
                              color: Color(0xff9747FF),
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  const AppBoldText(text: 'Shipping details', fontsize: 16),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.white,
                    padding:
                        const EdgeInsets.only(top: 11, bottom: 11, left: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          orders.shippingaddress,
                          style: const TextStyle(
                              fontFamily: 'GT-Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        BlocBuilder<UserDetailsBloc, UserDetailsState>(
                          builder: (context, state) {
                            String phone = "";
                            if (state is UserDetailsLoadingDone) {
                              phone = state.userdetails.phoneno;
                            }
                            return Text(
                              phone,
                              style: const TextStyle(
                                  fontFamily: 'GT-Regular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    ));
  }
}
