part of 'order_details_bloc.dart';

@immutable
abstract class OrderDetailsEvent {}

class FetchOrdersDetailsEvent extends OrderDetailsEvent {
  final String id;
  FetchOrdersDetailsEvent({required this.id});
}
