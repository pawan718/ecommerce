part of 'login_signup_bloc.dart';

@immutable
abstract class LoginSignupState {}

class LoginSignupInitial extends LoginSignupState {}

class Loadingstate extends LoginSignupState {}

class LoggedInState extends LoginSignupState {}

class ErrorState extends LoginSignupState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
