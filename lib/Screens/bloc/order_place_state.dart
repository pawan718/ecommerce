part of 'order_place_bloc.dart';

@immutable
abstract class OrderPlaceState {}

class OrderPlaceInitial extends OrderPlaceState {}

class OrderPlaceLoading extends OrderPlaceState {}

class OrderSuccessfullyPlace extends OrderPlaceState {}
