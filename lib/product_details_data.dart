class ProductDetailsData {
  ProductDetailsData(
    this.docid, {
    required this.sizes,
    required this.imageurl,
    required this.itemname,
    required this.itemprice,
    required this.description,
    required this.shippingpolicy,
  });
  final String imageurl;
  final String itemname;
  final String itemprice;
  final String description;
  final String docid;
  final String shippingpolicy;
  final List<dynamic> sizes;
}
