part of 'item_details_bloc.dart';

@immutable
abstract class ItemDetailsEvent {}

class ItemContent extends ItemDetailsEvent {
  final String docid;
  ItemContent(this.docid);
}
