import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/core/utils/network/dio.dart';
import 'package:swifit_cart/features/cart/data/cart_model.dart';
import '../../../../constant.dart';
import 'cart_repo.dart';
import 'change_cart_model.dart';

class CartRepoImpl extends CartRepo{
  CartRepoImpl( this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, CartModel>> fetchCart() async{
    try{
      var data= await apiService.get(
          token: token,
          urlEndPoint:"carts",
         );
      CartModel cartModel=CartModel.fromJson(data);
      return right(cartModel);
    }catch (e) {
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
  Future<Either<Failure, ChangeCartModel>> changeCart({required int id})async {
    try{
      var data= await apiService.post(
          token: token,
          urlEndPoint:"carts",
          data: {"product_id":id});
      ChangeCartModel changeCartModel=ChangeCartModel.fromJson(data);
      return right(changeCartModel);
    }catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}