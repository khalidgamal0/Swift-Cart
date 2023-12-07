import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/core/utils/network/dio.dart';
import 'package:swifit_cart/features/auth/data/models/login_model.dart';
import 'package:swifit_cart/features/auth/data/models/sign_up_model.dart';
import 'package:swifit_cart/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  ApiService apiService ;
  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiService.post(
        urlEndPoint: loginUrl,
        queryParameters: {
          "email": email,
          "password": password,
        },
      );
      LoginModel loginModel = LoginModel.fromJson(data);
      return right(loginModel);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SignUpModel>> signUp({
    required String? email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      var data = await apiService.post(urlEndPoint: registerUrl, queryParameters: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      });
      SignUpModel signUpModel = SignUpModel.fromJson(data);
      return right(signUpModel);
    }catch(e){
      if(e is DioException){
      return left(ServerFailure.fromDioException(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
