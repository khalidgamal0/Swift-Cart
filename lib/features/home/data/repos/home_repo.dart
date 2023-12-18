import 'package:dartz/dartz.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/home/data/models/categories_model.dart';
import 'package:swifit_cart/features/home/data/models/category_products_model.dart';
import 'package:swifit_cart/features/home/data/models/home_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> fetchHomeData({required String token});
  Future<Either<Failure, CategoriesModel>> fetchCategoriesData({required String token});
  Future<Either<Failure, CategoryProductsModel>> fetchCategoryProductsData({required String token,required String id});

}
