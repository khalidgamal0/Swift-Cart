import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/features/home/data/models/categories_model.dart';
import 'package:swifit_cart/features/home/data/models/category_products_model.dart';
import 'package:swifit_cart/features/home/data/models/home_model.dart';
import 'package:swifit_cart/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepo homeRepo;

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  HomeModel ? homeModel;
  CategoriesModel ?categoriesModel;

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    var homeResult = await homeRepo.fetchHomeData(token: token!);
    homeResult.fold((failure) {
      print(failure.errorMessage);
      emit(HomeFailure(failure.errorMessage));
    }, (homeData) {
      homeModel = homeData;
      emit(HomeSuccess(homeData));
    });
  }

  Future<void> fetchCategoriesData() async {
    emit(CategoriesLoading());
    var categoriesResult = await homeRepo.fetchCategoriesData(token: token!);
    categoriesResult.fold((failure) {
      emit(CategoriesFailure(failure.errorMessage));
    }, (categoriesData) {
      categoriesModel = categoriesData;
      emit(CategoriesSuccess(categoriesData));
    });
  }

  CategoryProductsModel ? categoryProductsModel;

  Future<void> fetchCategoryProductsData({required String id}) async {
    emit(CategoryProductsLoading());
    var categoryProductsResult = await homeRepo.fetchCategoryProductsData(token: token!,id: id);
    categoryProductsResult.fold((failure) {
      print(failure.errorMessage);
      emit(CategoryProductsFailure(failure.errorMessage));
    }, (categoryProductsData) {
      categoryProductsModel = categoryProductsData;
      emit(CategoryProductsSuccess(categoryProductsData));
    });
  }

}
