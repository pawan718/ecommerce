part of 'order_place_bloc.dart';

@immutable
abstract class OrderPlaceEvent {}

class OrderPlace extends OrderPlaceEvent {
  final String orderdate;
  final String orderamount;
  final String itemcount;
  final String shippingAddress;
  final String orderstatus;
  final String orderid;
  final List<AddToCartProductModel> orders;
  OrderPlace(
      {required this.orders,
      required this.itemcount,
      required this.orderstatus,
      required this.orderamount,
      required this.orderdate,
      required this.orderid,
      required this.shippingAddress});
}
