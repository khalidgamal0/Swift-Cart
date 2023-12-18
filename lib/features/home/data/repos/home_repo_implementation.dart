import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/core/utils/network/dio.dart';
import 'package:swifit_cart/features/home/data/models/categories_model.dart';
import 'package:swifit_cart/features/home/data/models/category_products_model.dart';
import 'package:swifit_cart/features/home/data/models/home_model.dart';
import 'package:swifit_cart/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, HomeModel>> fetchHomeData(
      {required String token}) async {
    try {
      var homeData = await apiService.get(
        urlEndPoint: homeUrl,
        token: token,
      );
      HomeModel homeModel = HomeModel.fromJson(homeData);
      return right(homeModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> fetchCategoriesData({required String token}) async {
    try {
      var categoriesData = await apiService.get(
        urlEndPoint: categoriesUrl,
        token: token,
      );
      CategoriesModel categoriesModel = CategoriesModel.fromJson(categoriesData);
      return right(categoriesModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, CategoryProductsModel>> fetchCategoryProductsData({required String token, required String id}) async {
    try {
      var categoryProductData = await apiService.get(
        urlEndPoint:"$categoriesUrl/$id",
        token: token,
      );
      CategoryProductsModel categoryProductModel = CategoryProductsModel.fromJson(categoryProductData);
      return right(categoryProductModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }
}
