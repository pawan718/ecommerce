part of 'login_signup_bloc.dart';

@immutable
abstract class LoginSignupEvent {}

class LoginEvent extends LoginSignupEvent {
  String email;
  String password;
  LoginEvent({required this.password, required this.email});
}

class LogoutEvent extends LoginSignupEvent {}

class SignupEvent extends LoginSignupEvent {
  final String email;
  final String password;
  final String firstname;
  final String gender;
  final int age;
  final String phoneno;
  final String lastname;
  SignupEvent({
    required this.email,
    required this.password,
    required this.firstname,
    required this.gender,
    required this.age,
    required this.phoneno,
    required this.lastname,
  });
}
