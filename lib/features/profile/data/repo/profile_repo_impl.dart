import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/auth/data/models/auth_model.dart';
import 'package:swifit_cart/features/profile/data/repo/profile_repo.dart';
import '../../../../constant.dart';
import '../../../../core/utils/network/dio.dart';
import '../../../adress/data/model/address_model.dart';

class ProfileRepoImpl extends ProfileRepo {
  ProfileRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, AuthModel>> fetchAccountData() async {
    try {
      var response = await apiService.get(
        urlEndPoint: 'profile',
        token: token,
      );
      AuthModel authModel = AuthModel.fromJson(response);
      return right(authModel);
    } catch (error) {
      if (error is DioException) {
        return left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthModel>> updateAccountData(
      String name,String email,String phone,
      )async {
    try {
      var response = await apiService.put(
        urlEndPoint: 'update-profile',
        data: {
          'name':name,
          'email':email,
          'phone':phone,
        },
        token: token,
      );
      AuthModel authModel = AuthModel.fromJson(response);
      return right(authModel);
    } catch (error) {
      if (error is DioException) {
        return left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
      }

  @override
  Future<Either<Failure, dynamic>> logOutAccount(String token)async {
    try{
      var response= await apiService.post(urlEndPoint: 'logout');
      return right(response);

    }catch(error){
      if (error is DioException) {
        return left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }


  @override
  Future<Either<Failure, AddressModel>> fetchAddressData() {
    // TODO: implement fetchAddressData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AddressModel>> addAddressData() {
    // TODO: implement addAddressData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AddressModel>> deleteAddressData() {
    // TODO: implement deleteAddressData
    throw UnimplementedError();
  }

 
}
