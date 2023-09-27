class AddToCartProductModel {
  final String productname;
  final String productsize;
  final String picurl;
  final String price;
  int itemcount;
  AddToCartProductModel(
      {required this.price,
      required this.productname,
      required this.picurl,
      required this.itemcount,
      required this.productsize});
}
