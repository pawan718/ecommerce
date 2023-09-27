import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/address_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'get_address_event.dart';
part 'get_address_state.dart';

class GetAddressBloc extends Bloc<GetAddressEvent, GetAddressState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GetAddressBloc() : super(GetAddressInitial()) {
    on<GetAddress>((event, emit) async {
      final user = _auth.currentUser?.uid;
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user)
          .collection('Address')
          .get();
      List<Addressdata> addresses = [];
      for (var doc in snapshot.docs) {
        String street = doc['street'];
        String city = doc['city'];
        String state = doc['state'];
        String pincode = doc['pincode'];
        final address = Addressdata(
            state: state, pincode: pincode, city: city, street: street);
        addresses.add(address);
      }
      emit(LoadingAddressDone(addresses: addresses));
    });
  }
}
