import 'package:dartz/dartz.dart';
import 'package:swifit_cart/features/favorite/data/favorite_model.dart';

import '../../../../core/utils/errors/failures.dart';

abstract class FavoriteRepo {

  Future<Either<Failure, FavoriteModel>> getFavorite();


}
