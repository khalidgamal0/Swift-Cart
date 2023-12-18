import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/core/widgets/toast.dart';
import 'package:swifit_cart/features/adress/data/model/address_model.dart';
import 'package:swifit_cart/features/adress/data/repo/address_repo_fimpl.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.addressRepoImpl) : super(AddressInitial());
 static AddressCubit get(context)=>BlocProvider.of(context);
  final AddressRepoImpl addressRepoImpl;
  AddressModel? addressModel;

  var formKey = GlobalKey<FormState>();
  var countryController=TextEditingController();
  var cityController=TextEditingController();
  var regionController=TextEditingController();
  var streetController=TextEditingController();

  Future<void> addAddress(context) async {
    emit(AddressLoadingState());
    var result = await addressRepoImpl.
    addAddressData(
      country: countryController.text,
      city: cityController.text,
      region: regionController.text,
      street: streetController.text,);
    result.fold((l) {
      emit(AddAddressErrorState());
    },
            (r) {
      fetchAddress();

          emit(AddAddressSuccessState(),);
      showToast(message: 'Added Successfully', state: ToastStates.success);
      Navigator.pop(context);
        });
  }

  Future<void> fetchAddress() async {
    emit(AddressLoadingState());
    var result = await addressRepoImpl.
    fetchAddressData();
    result.fold((l) {
      emit(GetAddressErrorState(l.toString()));
    },
            (r) {
          addressModel=r;
          countryController.clear();
          cityController.clear();
          regionController.clear();
          streetController.clear();
          emit(GetAddressSuccessState(),);
        });
  }

  Future<void> deleteAddress(context,{required String id}) async {
    emit(AddressLoadingState());
    var result = await addressRepoImpl.
    deleteAddressData(id);
    result.fold((l) {
      emit(DeleteAddressErrorState());
    },
            (r) {
        fetchAddress();
          emit(DeleteAddressSuccessState(),);
          showToast(message: 'Deleted Successfully', state: ToastStates.success);
          Navigator.pop(context);
        });
  }

  Future<void> updateAddress({required String id}) async {
    emit(AddressLoadingState());
    var result = await addressRepoImpl.
    updateAddressData(id,
      country: countryController.text,
      city: cityController.text,
      region: regionController.text,
      street: streetController.text,);
    result.fold((l) {
      emit(UpdateAddressErrorState());
    },
            (r) {
          fetchAddress();
          emit(UpdateAddressSuccessState(),);
          showToast(message: 'updated Successfully', state: ToastStates.success);
            });
  }



}
