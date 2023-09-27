part of 'wish_list_bloc.dart';

@immutable
abstract class WishListState {}

class WishListInitial extends WishListState {}

class ProductSuccessfullyAddedToWishlist extends WishListState {}

class ProductIsAlreeadyddedToWishlist extends WishListState {}

class WishlistProductsLoading extends WishListState {}

class WishlistProductsSuccessfullyLoaded extends WishListState {
  final List<WishlistProductsDataModel> wishlistproducts;
  WishlistProductsSuccessfullyLoaded({required this.wishlistproducts});
}

class WishListProductsCount extends WishListState {
  final int count;
  WishListProductsCount({required this.count});
}
