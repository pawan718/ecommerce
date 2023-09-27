import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/product_details_data.dart';
import 'package:meta/meta.dart';

part 'item_details_event.dart';
part 'item_details_state.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  ItemDetailsBloc() : super(ItemDetailsInitial()) {
    on<ItemContent>((event, emit) async {
      emit(ItemsLoadingstate());
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Items').doc(event.docid).get();
      Map<String, dynamic>? documentData = snapshot.data();
      final docid = snapshot.id;
      final description = documentData!['Description'];
      final imageurl = documentData!['picurl'];
      final List<dynamic> sizes = documentData!['Availablesize'];
      final itemname = documentData!['itemname'];
      final price = documentData!['Price'];
      final returnpolicy = documentData!['Returnpolicy'];

      final itemdetails = ProductDetailsData(docid,
          imageurl: imageurl,
          itemname: itemname,
          itemprice: price,
          sizes: sizes,
          description: description,
          shippingpolicy: returnpolicy);
      emit(ItemsLoadingDone(itemdetails));
    });
  }
}
