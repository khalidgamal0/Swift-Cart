import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/core/utils/network/dio.dart';

import 'package:swifit_cart/features/adress/data/model/address_model.dart';

import '../../../../core/utils/end_point.dart';
import 'address_repo.dart';

class AddressRepoImpl extends AddressRepo {
  final ApiService apiService;
  AddressRepoImpl(this.apiService);

  @override
  Future<Either<Failure, dynamic>> addAddressData({
    required String country,
    required String city,
    required String region,
    required String street,
  }) async {
    try {
      var response = await apiService.post(
        urlEndPoint: addressEndPoint,
          data:{
        'name':country,
        'city':city,
        'region':region,
        'details':street,
        'latitude':'30.0616863',
        'longitude':'31.3260088',
      },
      token: token!,
      );
      AddressModel addressModel = AddressModel.fromJson(response);
      return right(addressModel);
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
  Future<Either<Failure, AddressModel>> fetchAddressData()async {
    try {
      var response = await apiService.get(
        urlEndPoint: addressEndPoint,
        token: token!,
      );
      AddressModel addressModel = AddressModel.fromJson(response);
      return right(addressModel);
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
  Future<Either<Failure, dynamic>> updateAddressData(String id,{
    required String country,
    required String city,
    required String region,
    required String street,
}) async {
    try {
      var response = await apiService.put(
        urlEndPoint: '$addressEndPoint/$id',
        token: token!,
        data:{
          'name':country,
          'city':city,
          'region':region,
          'details':street,
          'latitude':'30.0616863',
          'longitude':'31.3260088',
        },
      );
      return right(response);
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
  Future<Either<Failure, dynamic>> deleteAddressData(String id) async {
    try {
      var response = await apiService.delete(
        urlEndPoint: '$addressEndPoint/$id',
        token: token!,
      );
      return right(response);
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




}
