import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failures.dart';
import '../model.dart';

abstract class SearchRepo{
  Future<Either<Failure, SearchModel>> fetchSearch({required String text});
}