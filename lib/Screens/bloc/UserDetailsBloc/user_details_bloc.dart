import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Screens/user_details_model.dart';
import 'package:ecommerce/Screens/bloc/ShoppingItemsBloc/shopping_iitems_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<finduserdetails>((event, emit) async {
      emit(UserDetailsLoading());
      try {
        final uid = _auth.currentUser?.uid;
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await _firestore.collection('users').doc(uid).get();
        Map<String, dynamic>? documentData = snapshot.data();
        String firstname = documentData!['firstname'];
        String email = documentData!['email'];
        String phoneno = documentData!['phoneno'];
        String lastname = documentData!['lastname'];
        final userdetails = UserDetailsModel(
          email: email,
          firstname: firstname,
          lastname: lastname,
          phoneno: phoneno,
        );
        emit(UserDetailsLoadingDone(userdetails: userdetails));
      } catch (e) {
        print(e);
      }
    });
  }
}
