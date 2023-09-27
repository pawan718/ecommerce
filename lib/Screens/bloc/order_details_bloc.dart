import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/order_details_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderTrackingDetailsBloc
    extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  OrderTrackingDetailsBloc() : super(OrderDetailsInitial()) {
    emit(OrderTrackingDetailsLoading());
    on<FetchOrdersDetailsEvent>((event, emit) async {
      final user = _auth.currentUser?.uid;
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .doc(user)
          .collection('orders')
          .doc(event.id)
          .get();
      Map<String, dynamic>? documentData = snapshot.data();
      final itemcount = documentData!['itemcount'];
      final orderstatus = documentData['orderstatus'];
      final shippindetails = documentData['shippingdetails'];
      final orderid = documentData['orderid'];
      final orderdata = OrderTrackingDataModel(
          id: '',
          orderid: orderid,
          itemcount: itemcount,
          orderstatus: orderstatus,
          shippingaddress: shippindetails);
      emit(OrderTrackingDetailsLoadingDone(orders: orderdata));
    });
  }
}
