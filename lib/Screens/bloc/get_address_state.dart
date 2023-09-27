part of 'get_address_bloc.dart';

@immutable
abstract class GetAddressState {}

class GetAddressInitial extends GetAddressState {}

class LoadingAdress extends GetAddressState {}

class LoadingAddressDone extends GetAddressState {
  final List<Addressdata> addresses;
  LoadingAddressDone({required this.addresses});
}
