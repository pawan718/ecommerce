import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/products_data.dart';
import 'package:meta/meta.dart';

part 'shopping_iitems_event.dart';
part 'shopping_iitems_state.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class ShoppingItemsBloc extends Bloc<ShoppingIitemsEvent, ShoppingIitemsState> {
  ShoppingItemsBloc() : super(ShoppingIitemsInitial()) {
    on<ClothShoppingItems>((event, emit) async {
      emit(Loadingdata());
      QuerySnapshot snapshot = await _firestore
          .collection('Items')
          .where("picurl",
              isEqualTo:
                  'https://fastly.picsum.photos/id/122/200/300.jpg?hmac=OfQ8cObBgD7BOhMjqNrjqHDjO-rXiNQ4KvSd8QRAuIA')
          .get();
      List<Products> clothshoppingproducts = [];
      List<Products> accessoriesproducts = [];
      List<Products> beautyproducts = [];
      List<Products> shoesproducts = [];
      for (var docSnapshot in snapshot.docs) {
        final uid = docSnapshot.id;
        final picurl = docSnapshot['picurl'];
        final itemname = docSnapshot['itemname'];
        final price = docSnapshot['Price'];
        final cetegoryofproduct = docSnapshot['Cetegoryofproduct'];
        final dataofproducts = Products(
            itemname: itemname,
            uid: uid,
            price: price,
            producturl: picurl,
            ceteogoryofproduct: cetegoryofproduct);
        if (dataofproducts.ceteogoryofproduct == "1") {
          clothshoppingproducts.add(dataofproducts);
        } else if (dataofproducts.ceteogoryofproduct == "2") {
          accessoriesproducts.add(dataofproducts);
        } else if (dataofproducts.ceteogoryofproduct == "3") {
          beautyproducts.add(dataofproducts);
        } else {
          shoesproducts.add(dataofproducts);
        }
      }

      emit(Loadingdone(
          value: Values.accessories,
          products: clothshoppingproducts,
          accessories: accessoriesproducts,
          beauty: beautyproducts,
          shoes: shoesproducts));
    });
    on<Cetegorywisefetchingdata>((event, emit) async {
      emit(Loadingdata());
      QuerySnapshot snapshot = await _firestore
          .collection('Items')
          .where("Cetegoryofproduct", isEqualTo: event.id)
          .get();
      List<Products> shoppingproducts = [];
      for (var docSnapshot in snapshot.docs) {
        final uid = docSnapshot.id;
        final String picurl = docSnapshot['picurl'];
        final itemname = docSnapshot['itemname'];
        final price = docSnapshot['Price'];
        final cetegoryofproduct = docSnapshot['Cetegoryofproduct'];
        final dataofproducts = Products(
            itemname: itemname,
            uid: uid,
            price: price,
            producturl: picurl,
            ceteogoryofproduct: cetegoryofproduct);
        shoppingproducts.add(dataofproducts);
      }
      emit(CetegoryofproductLoadingdone(products: shoppingproducts));
    });
  }
}
