import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/orders_data_mode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  OrdersBloc() : super(OrdersInitial()) {
    on<FetchOrders>((event, emit) async {
      emit(OrdersLoading());
      final user = _auth.currentUser?.uid;
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user)
          .collection('orders')
          .where('orderstatus', isEqualTo: event.orderstatus)
          .get();
      List<OrdersDataModel> orders = [];
      for (var order in snapshot.docs) {
        final id = order.id;
        final orderid = order['orderid'];
        final itemcount = order['itemcount'];
        final od =
            OrdersDataModel(itemcount: itemcount, orderid: orderid, id: id);
        orders.add(od);
      }
      emit(OrdersLoadingDone(orders: orders));
    });
  }
}
