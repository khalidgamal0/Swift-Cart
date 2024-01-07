part of 'favorite_cubit.dart';

abstract class FavoriteState {}
class FavoriteInitial extends FavoriteState {}

class ChangeFavoriteSuccess extends FavoriteState {}
class ChangeFavoriteError extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}
class GetFavoriteSuccess extends FavoriteState {}
class GetFavoriteError extends FavoriteState {}
