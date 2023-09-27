part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsState {}

class ItemDetailsInitial extends ItemDetailsState {}

class ItemsLoadingstate extends ItemDetailsState {}

class ItemsLoadingDone extends ItemDetailsState {
  final ProductDetailsData data;
  ItemsLoadingDone(this.data);
}
