import 'package:dartz/dartz.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {

  Future<Either<Failure, AuthModel>> signUp({
    required String? email,
    required String password,
    required String phone,
    required String name,
  });

  Future<Either<Failure, AuthModel>> login({
    required String email,
    required String password,
  });
}
