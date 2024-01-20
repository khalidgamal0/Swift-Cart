import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/features/favorite/data/repo/favorite_repo_impl.dart';
import '../../data/favorite_model.dart';
import '../../data/repo/change_fav_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepoImpl) : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);


  final FavoriteRepoImpl favoriteRepoImpl;
  FavoritesModel? favoriteModel;
  ChangeFavoriteModel? changeFavoriteModel;
  Future<void> getFavorite() async {
    emit(GetFavoriteLoading());
    var result = await favoriteRepoImpl.fetchFavorite();
    result.fold((l) {
      emit(GetFavoriteError());
    }, (r) {
      favoriteModel = r;
      emit(GetFavoriteSuccess());
    });
  }

  changeFavorite({required int id}) async {
    emit(ChangeFavoriteLoading());
    var result = await favoriteRepoImpl.changeFavorite(id: id);
    result.fold((l) => emit(ChangeFavoriteError()), (r) {
      changeFavoriteModel=r;
      getFavorite();
    });
  }

}
// await ApiService(Dio()).post(
//         urlEndPoint:"favorites",
//         token: token,
//         data: {"id":id},).then((value){
//         getFavorite();
//         emit(ChangeFavoriteSuccess());
//       }).catchError((e){
//         print(e.toString());
//         emit(ChangeFavoriteError());
//       });