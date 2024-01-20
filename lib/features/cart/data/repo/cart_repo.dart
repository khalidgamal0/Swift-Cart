import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failures.dart';
import '../cart_model.dart';
import 'change_cart_model.dart';

abstract class CartRepo{

  Future<Either<Failure, CartModel>> fetchCart();

  Future<Either<Failure, ChangeCartModel>> changeCart({required int id});

}