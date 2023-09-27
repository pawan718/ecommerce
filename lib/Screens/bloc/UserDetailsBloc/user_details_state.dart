part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoadingDone extends UserDetailsState {
  final UserDetailsModel userdetails;
  UserDetailsLoadingDone({required this.userdetails});
}
