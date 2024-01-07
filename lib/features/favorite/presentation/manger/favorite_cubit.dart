import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/features/favorite/data/repo/favorite_repo_impl.dart';
import '../../../../core/utils/network/dio.dart';
import '../../data/favorite_model.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepoImpl) : super(FavoriteInitial());
  static FavoriteCubit get(context)=> BlocProvider.of(context);


  final FavoriteRepoImpl favoriteRepoImpl;
  FavoritesModel? favoriteModel;

  Future<void> getFavorite() async{
    emit(FavoriteLoading());
    var result=await favoriteRepoImpl.getFavorite();
    result.fold((l) {
      emit(GetFavoriteError());
    }, (r){
      favoriteModel=r;
      emit(GetFavoriteSuccess());
    });
  }

  changeFavorite({required int id})async {
      await ApiService(Dio()).post(
        urlEndPoint:"favorites",
        token: token,
        data: {"id":id},).then((value){
        getFavorite();
        emit(ChangeFavoriteSuccess());
      }).catchError((e){
        print(e.toString());
        emit(ChangeFavoriteError());
      });
  }

}
