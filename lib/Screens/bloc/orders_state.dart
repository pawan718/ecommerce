part of 'orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoadingDone extends OrdersState {
  final List<OrdersDataModel> orders;
  OrdersLoadingDone({required this.orders});
}
