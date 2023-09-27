import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/add_to_cart_Products_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'order_place_event.dart';
part 'order_place_state.dart';

class OrderPlaceBloc extends Bloc<OrderPlaceEvent, OrderPlaceState> {
  Uuid uuid = const Uuid();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  OrderPlaceBloc() : super(OrderPlaceInitial()) {
    on<OrderPlace>((event, emit) async {
      emit(OrderPlaceLoading());
      final user = _auth.currentUser?.uid;
      final collectionref =
          _firestore.collection("users").doc(user).collection("orders");
      final _orderRef = await collectionref.add({
        'orderid': event.orderid,
        'shippingdetails': event.shippingAddress,
        'itemcount': event.itemcount,
        'orderTimedate': event.orderdate,
        'orderstatus': event.orderstatus,
        'orderamount': event.orderamount,
      });
      final orderitems = collectionref.doc(_orderRef.id).collection("Items");
      event.orders.forEach((element) {
        orderitems.add({
          'productname': element.productname,
          'productsize': element.productsize,
          'quantity': element.itemcount,
          'picurl': element.picurl,
          'price': element.price,
        });
      });
      emit(OrderSuccessfullyPlace());
    });
  }
}
