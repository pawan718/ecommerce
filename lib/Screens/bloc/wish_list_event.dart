part of 'wish_list_bloc.dart';

@immutable
abstract class WishListEvent {}

class AddProductToWishLIst extends WishListEvent {
  final String docid;
  final String picurl;
  final String productname;
  AddProductToWishLIst(
      {required this.picurl, required this.productname, required this.docid});
}

class FetchWishListProducts extends WishListEvent {}

class FetchProductLength extends WishListEvent {}
