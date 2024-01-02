import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/errors/failures.dart';
import 'package:swifit_cart/features/search/data/model.dart';
import 'package:swifit_cart/features/search/data/repo/search_repo.dart';
import '../../../../core/utils/network/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;
  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SearchModel>> fetchSearch({required String text})async {
    try {
      var response =await  apiService.post(
        urlEndPoint: searchUrl,
        data: {"text":text},
      );
      SearchModel searchModel= SearchModel.fromJson(response);
      return right(searchModel);
    } catch (error) {
      if (error is DioException) {
        return left(
          ServerFailure.fromDioException(error),
        );
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }
}
