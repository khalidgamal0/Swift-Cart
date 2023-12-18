import 'package:dartz/dartz.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/auth/data/models/auth_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, AuthModel>> fetchAccountData();

  Future<Either<Failure, AuthModel>> updateAccountData(
    String name,
    String email,
    String phone,
  );
  Future<Either<Failure, dynamic>> logOutAccount(String token);


}
