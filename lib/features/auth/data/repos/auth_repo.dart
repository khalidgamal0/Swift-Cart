import 'package:dartz/dartz.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/auth/data/models/login_model.dart';
import 'package:swifit_cart/features/auth/data/models/sign_up_model.dart';

abstract class AuthRepo {

  Future<Either<Failure, SignUpModel>> signUp({
    required String? email,
    required String password,
    required String phone,
    required String name,
  });

  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });

}
