import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_signup_event.dart';
part 'login_signup_state.dart';

class AuthenticationBloc extends Bloc<LoginSignupEvent, LoginSignupState> {
  AuthenticationBloc() : super(LoginSignupInitial()) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    on<SignupEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        print('laodingstate');
        final user = await _auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        if (user != null) {
          _firestore.collection('users').doc(user.user?.uid).set({
            'firstname': event.firstname,
            'lastname': event.lastname,
            'phoneno': event.phoneno,
            'password': event.password,
            'email': event.email,
            'age': event.age,
            'gender': event.gender,
          });
        }
        emit(LoggedInState());
      } catch (e) {
        ErrorState(e.toString());
      }
    });
    on<LogoutEvent>((event, emit) async => await _auth.signOut());

    on<LoginEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(LoggedInState());
      } catch (e) {
        ErrorState(e.toString());
      }
    });
  }
}
