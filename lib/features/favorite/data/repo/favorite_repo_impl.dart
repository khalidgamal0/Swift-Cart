import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/favorite/data/favorite_model.dart';
import '../../../../constant.dart';
import '../../../../core/utils/network/dio.dart';
import 'change_fav_model.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  ApiService apiService ;
  FavoriteRepoImpl(this.apiService);


  @override
  Future<Either<Failure, FavoritesModel>> fetchFavorite()async {
    try{
      var data=await apiService.get(
        token: token,
        urlEndPoint:"favorites",);
      FavoritesModel favoriteModel=FavoritesModel.fromJson(data);
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

  @override
  Future<Either<Failure, ChangeFavoriteModel>> changeFavorite({required int id})async {
    try{
     var data= await apiService.post(
        token: token,
        urlEndPoint:"favorites",
        data: {"product_id":id});
     ChangeFavoriteModel changeFavoriteModel=ChangeFavoriteModel.fromJson(data);
      return right(changeFavoriteModel);
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
