part of 'favorite_cubit.dart';

abstract class FavoriteState {}
class FavoriteInitial extends FavoriteState {}

class ChangeFavoriteLoading extends FavoriteState {}
class ChangeFavoriteSuccess extends FavoriteState {}
class ChangeFavoriteError extends FavoriteState {}

class GetFavoriteLoading extends FavoriteState {}
class GetFavoriteSuccess extends FavoriteState {}
class GetFavoriteError extends FavoriteState {}
