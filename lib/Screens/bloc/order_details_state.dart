part of 'order_details_bloc.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderTrackingDetailsLoading extends OrderDetailsState {}

class OrderTrackingDetailsLoadingDone extends OrderDetailsState {
  final OrderTrackingDataModel orders;
  OrderTrackingDetailsLoadingDone({required this.orders});
}
