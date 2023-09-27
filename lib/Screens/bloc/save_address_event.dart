part of 'save_address_bloc.dart';

@immutable
abstract class SaveAddressEvent {}

class SaveAddress extends SaveAddressEvent {
  final String street;
  final String city;
  final String state;
  final String pincode;
  SaveAddress(
      {required this.state,
      required this.city,
      required this.pincode,
      required this.street});
}
