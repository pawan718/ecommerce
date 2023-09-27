part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartEvent {}

class CaculatePriceOfAllItems extends AddToCartEvent {}

class IncreaseItem extends AddToCartEvent {
  final String itemname;
  IncreaseItem({
    required this.itemname,
  });
}

class DecreaseItem extends AddToCartEvent {
  final String itemname;
  DecreaseItem({
    required this.itemname,
  });
}

class RemoveAllTaskFromCartEvent extends AddToCartEvent {}

class RemoveProductEvent extends AddToCartEvent {
  final int productname;
  RemoveProductEvent(this.productname);
}

class AddtoCartCheckCartIsEmptyOrNot extends AddToCartEvent {}

class AddToCartItemEvent extends AddToCartEvent {
  final String productname;
  final String productsize;
  final String picurl;
  final String price;
  final int itemcount;

  AddToCartItemEvent(
      {required this.price,
      required this.productname,
      required this.picurl,
      required this.itemcount,
      required this.productsize});
}
