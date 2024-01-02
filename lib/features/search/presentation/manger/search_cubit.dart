import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/features/search/data/model.dart';
import 'package:swifit_cart/features/search/data/repo/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImpl) : super(SearchInitial());
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final SearchRepoImpl searchRepoImpl;
  var searchController=TextEditingController() ;
  SearchModel? searchModel;

  static SearchCubit get(context) => BlocProvider.of(context);

  fetchSearch({required String text}) async {
    emit(SearchLoading());
    var data = await searchRepoImpl.fetchSearch(text: text);
    data.fold(
      (l) {
        emit(SearchError());
      },
      (r) {
        searchModel=r;
        emit(SearchSuccess());
      },
    );
  }
}
