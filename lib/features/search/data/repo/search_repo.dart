import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failures.dart';
import '../searchModel.dart';

abstract class SearchRepo{
  Future<Either<Failure, SearchModel>> fetchSearch({required String text});
}