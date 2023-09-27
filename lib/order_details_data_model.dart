class OrderTrackingDataModel {
  final String id;
  final String orderid;
  final String itemcount;
  final String shippingaddress;
  final String orderstatus;
  OrderTrackingDataModel(
      {required this.id,
      required this.orderid,
      required this.itemcount,
      required this.orderstatus,
      required this.shippingaddress});
}
