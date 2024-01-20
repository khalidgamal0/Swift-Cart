import 'package:dartz/dartz.dart';
import 'package:swifit_cart/features/favorite/data/favorite_model.dart';

import '../../../../core/utils/errors/failures.dart';
import 'change_fav_model.dart';

abstract class FavoriteRepo {

  Future<Either<Failure, FavoritesModel>> fetchFavorite();

  Future<Either<Failure, ChangeFavoriteModel>> changeFavorite({required int id});


}
