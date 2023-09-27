import 'package:ecommerce/Screens/bloc/order_details_bloc.dart';
import 'package:ecommerce/Screens/bloc/orders_bloc.dart';
import 'package:ecommerce/Screens/homepage/order_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common_widgets/app_bold_text.dart';
import '../../common_widgets/order_list.dart';
import '../../common_widgets/order_status_item.dart';
import '../orders_data_mode.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<OrdersDataModel> orders = [];
  final List<String> orderstatus = [
    'Order Placed',
    'shipped',
    'Delivered',
    'Returned',
    'Cancel'
  ];
  int selectedindex = 0;
  @override
  void initState() {
    // TODO: implement initState
    context.read<OrdersBloc>().add(FetchOrders(orderstatus: 'Order Placed'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 36, left: 24),
              child: AppBoldText(
                fontsize: 24,
                text: 'Orders',
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(children: [
              Expanded(
                child: SizedBox(
                  height: 25,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    itemCount: orderstatus.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => OrderStatusItem(
                        padding: const EdgeInsets.only(right: 13),
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                            context.read<OrdersBloc>().add(FetchOrders(
                                orderstatus: orderstatus[selectedindex]));
                          });
                        },
                        color: selectedindex == index
                            ? const Color(0xff9747FF)
                            : Colors.white,
                        textcolor: selectedindex == index
                            ? Colors.white
                            : Colors.black,
                        text: orderstatus[index]),
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<OrdersBloc, OrdersState>(
            builder: (context, state) {
              if (state is OrdersLoading) {
                return const CircularProgressIndicator();
              } else if (state is OrdersLoadingDone) {
                orders = state.orders;
              }
              return orders.isEmpty
                  ? const Center(child: Text('No orders '))
                  : Expanded(
                      child: ListView.builder(
                          itemCount: orders.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OrderandWishlistitemComponent(
                                ontap: () {
                                  context.read<OrderTrackingDetailsBloc>().add(
                                      FetchOrdersDetailsEvent(
                                          id: orders[index].id));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OrderTracking()));
                                },
                                imagepath: 'images/ordericon.svg',
                                itemname: 'Order #${orders[index].orderid}',
                                itemcount: '${orders[index].itemcount} items');
                          }),
                    );
            },
          ),
        ],
      ),
    ));
  }
}
