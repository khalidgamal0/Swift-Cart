part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class ChangeCartLoading extends CartState {}
class ChangeCartSuccess extends CartState {}
class ChangeCartError extends CartState {}

class GetCartLoading extends CartState {}
class GetCartSuccess extends CartState {}
class GetCartError extends CartState {}
