part of 'shopping_iitems_bloc.dart';

@immutable
abstract class ShoppingIitemsEvent {}

class ClothShoppingItems extends ShoppingIitemsEvent {}

class Cetegorywisefetchingdata extends ShoppingIitemsEvent {
  final String id;
  Cetegorywisefetchingdata({required this.id});
}

class Accessories extends ShoppingIitemsEvent {}

class BeautyShoppingItems extends ShoppingIitemsEvent {}

class ShoesShoppingItems extends ShoppingIitemsEvent {}
