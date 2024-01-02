import 'package:dartz/dartz.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/adress/data/model/address_model.dart';

abstract class AddressRepo {

  Future<Either<Failure, dynamic>> addAddressData({
    required String country,
    required String city,
    required String region,
    required String street,
});

  Future<Either<Failure, AddressModel>> fetchAddressData();

  Future<Either<Failure, dynamic>> deleteAddressData(String id);

  Future<Either<Failure, dynamic>> updateAddressData(String id,{required String country,
    required String city,
    required String region,
    required String street,});
}
