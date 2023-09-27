part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartIsEmpty extends AddToCartState {}

class AddToCartIsNotEmpty extends AddToCartState {}

class AddtocartItemsLoading extends AddToCartState {}

class Calcualteprice extends AddToCartState {
  int totalprice;
  Calcualteprice({required this.totalprice});
}

class ShoppincartState extends AddToCartState {
  List<AddToCartProductModel> addtocartproducts;
  double get totalPrice => addtocartproducts.fold(
      0,
      (total, product) =>
          total +
          (int.parse(product.price.replaceAll("\$", '')) * product.itemcount));
  ShoppincartState({required this.addtocartproducts});
}

class AddtoCartItemsLoadingDone extends AddToCartState {
  List<AddToCartProductModel> addtocartproducts;
  int totolpriceofallitems;
  int itemcount;
  AddtoCartItemsLoadingDone(
      {required this.addtocartproducts,
      required this.itemcount,
      required this.totolpriceofallitems});
}
