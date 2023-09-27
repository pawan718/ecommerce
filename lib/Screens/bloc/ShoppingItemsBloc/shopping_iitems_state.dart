part of 'shopping_iitems_bloc.dart';

enum Values { products, accessories, beauty, shoes }

@immutable
abstract class ShoppingIitemsState {}

class ShoppingIitemsInitial extends ShoppingIitemsState {}

class Loadingdata extends ShoppingIitemsState {}

class CetegoryofproductLoadingdone extends ShoppingIitemsState {
  List<Products> products;
  CetegoryofproductLoadingdone({required this.products});
}

class Loadingdone extends ShoppingIitemsState {
  List<Products> products;
  List<Products> accessories;
  List<Products> beauty;
  List<Products> shoes;
  Values value;
  Loadingdone(
      {required this.products,
      required this.accessories,
      required this.beauty,
      required this.shoes,
      required this.value});
}
