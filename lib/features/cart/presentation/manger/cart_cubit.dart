import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/features/cart/data/cart_model.dart';
import 'package:swifit_cart/features/cart/data/repo/cart_repo_impl.dart';

import '../../data/repo/change_cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepoImpl) : super(CartInitial());
  static CartCubit get(context)=>BlocProvider.of(context);
  final CartRepoImpl cartRepoImpl;
  CartModel? cartModel;
  ChangeCartModel? changeCartModel;

  void fetchCart()async{
    emit(GetCartLoading());
    var data=await cartRepoImpl.fetchCart();
    data.fold((l) => emit(GetCartError()), (r) {
      cartModel=r;
      emit(GetCartSuccess());
    });
  }


  void changeCart({required int id})async{
    emit(ChangeCartLoading());
    var data=await cartRepoImpl.changeCart(id: id);
    data.fold((l) =>emit(ChangeCartError()) , (r) {
      changeCartModel=r;
      fetchCart();
    });
  }
}
