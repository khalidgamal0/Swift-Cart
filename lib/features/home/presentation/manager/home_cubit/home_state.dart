part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
 final HomeModel homeModel;

  HomeSuccess(this.homeModel);

}
class HomeFailure extends HomeState {
  final String errorMessage ;
  HomeFailure(this.errorMessage);
}

class CategoriesLoading extends HomeState {}
class CategoriesSuccess extends HomeState {
 final CategoriesModel categoriesModel;

 CategoriesSuccess(this.categoriesModel);

}
class CategoriesFailure extends HomeState {
  final String errorMessage ;
  CategoriesFailure(this.errorMessage);
}

class CategoryProductsLoading extends HomeState {}
class CategoryProductsSuccess extends HomeState {
 final CategoryProductsModel categoryProductsModel;

 CategoryProductsSuccess(this.categoryProductsModel);

}
class CategoryProductsFailure extends HomeState {
  final String errorMessage ;
  CategoryProductsFailure(this.errorMessage);
}
