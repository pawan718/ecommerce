import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/wishlist_products_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  WishListBloc() : super(WishListInitial()) {
    final user = _auth.currentUser?.uid;
    on<AddProductToWishLIst>((event, emit) async {
      final doc = await _firestore
          .collection("users")
          .doc(user)
          .collection("wishlist")
          .where("docid", isEqualTo: event.docid)
          .get();
      if (doc.docs.isEmpty) {
        _firestore.collection("users").doc(user).collection("wishlist").add({
          'productname': event.productname,
          'docid': event.docid,
          'picurl': event.picurl,
        });
        emit(ProductSuccessfullyAddedToWishlist());
      } else {
        emit(ProductIsAlreeadyddedToWishlist());
      }
    });

    on<FetchWishListProducts>((event, emit) async {
      emit(WishlistProductsLoading());
      final documents = await _firestore
          .collection("users")
          .doc(user)
          .collection("wishlist")
          .get();
      List<WishlistProductsDataModel> wishlistproducts = [];
      for (var wishlistproduct in documents.docs) {
        final docid = wishlistproduct['docid'];
        final picurl = wishlistproduct['picurl'];
        final productname = wishlistproduct['productname'];
        final productdetails = WishlistProductsDataModel(
            docid: docid, productname: productname, producturl: picurl);
        wishlistproducts.add(productdetails);
      }
      emit(WishlistProductsSuccessfullyLoaded(
          wishlistproducts: wishlistproducts));
    });
  }
}
