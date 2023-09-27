import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/Screens/add_to_cart_Products_model.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  int findIndexByName(String name, List<AddToCartProductModel> products) {
    return products.indexWhere((product) => product.productname == name);
  }

  AddToCartBloc() : super(AddToCartInitial()) {
    List<AddToCartProductModel> addtocartproducts = [];
    on<AddtoCartCheckCartIsEmptyOrNot>((event, emit) {
      if (addtocartproducts.isEmpty) {
        emit(AddToCartIsEmpty());
      } else {
        emit(AddToCartIsNotEmpty());
      }
    });
    on<AddToCartItemEvent>((event, emit) {
      if (addtocartproducts
          .any((element) => element.productname == event.productname)) {
        int index = findIndexByName(event.productname, addtocartproducts);
        addtocartproducts[index].itemcount++;
        emit(ShoppincartState(addtocartproducts: addtocartproducts));
      } else {
        addtocartproducts.add(AddToCartProductModel(
            price: event.price,
            productname: event.productname,
            picurl: event.picurl,
            itemcount: event.itemcount,
            productsize: event.productsize));
        emit(ShoppincartState(addtocartproducts: addtocartproducts));
      }
    });
    on<IncreaseItem>((event, emit) {
      int index = findIndexByName(event.itemname, addtocartproducts);
      addtocartproducts[index].itemcount++;
      emit(ShoppincartState(addtocartproducts: addtocartproducts));
    });

    on<DecreaseItem>((event, emit) {
      int index = findIndexByName(event.itemname, addtocartproducts);
      if (addtocartproducts[index].itemcount > 1) {
        addtocartproducts[index].itemcount--;
      } else {
        addtocartproducts.removeAt(index);
      }

      emit(ShoppincartState(addtocartproducts: addtocartproducts));
    });
    on<RemoveAllTaskFromCartEvent>((event, emit) {
      addtocartproducts.removeRange(0, addtocartproducts.length);
      emit(ShoppincartState(addtocartproducts: addtocartproducts));
    });
  }
}
