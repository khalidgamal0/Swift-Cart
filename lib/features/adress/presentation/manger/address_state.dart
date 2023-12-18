part of 'address_cubit.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}
class AddressLoadingState extends AddressState {}
class AddAddressSuccessState extends AddressState {
}
class AddAddressErrorState extends AddressState {}

class UpdateAddressSuccessState extends AddressState {}
class UpdateAddressErrorState extends AddressState {}

class DeleteAddressSuccessState extends AddressState {}
class DeleteAddressErrorState extends AddressState {}

class GetAddressSuccessState extends AddressState {}
class GetAddressErrorState extends AddressState {
  final String errorMessage;

  GetAddressErrorState(this.errorMessage);
}
