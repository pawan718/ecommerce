import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'save_address_event.dart';
part 'save_address_state.dart';

class SaveAddressBloc extends Bloc<SaveAddressEvent, SaveAddressState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SaveAddressBloc() : super(SaveAddressInitial()) {
    on<SaveAddress>((event, emit) async {
      final user = _auth.currentUser?.uid;
      _firestore.collection('users').doc(user).collection('Address').add({
        'street': event.street,
        'city': event.city,
        'state': event.state,
        'pincode': event.pincode,
      });
    });
  }
}
