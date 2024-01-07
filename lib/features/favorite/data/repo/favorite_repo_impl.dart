import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/favorite/data/favorite_model.dart';
import '../../../../core/utils/network/dio.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  ApiService apiService ;
  FavoriteRepoImpl(this.apiService);


  @override
  Future<Either<Failure, FavoriteModel>> getFavorite()async {
    try{
      var data=await apiService.get(
        urlEndPoint:"favorites",);
      FavoriteModel favoriteModel=FavoriteModel.fromJson(data);
      return right(favoriteModel);
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
