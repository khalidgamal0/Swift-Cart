import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/features/category/presentation/view/category_view.dart';
import '../../cart/presentation/view/cart_view.dart';
import '../../home/presentation/view/home_view.dart';
import '../../profile/presentation/view/profile_view.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context){
    return BlocProvider.of(context);
  }

  int currentIndex=0;
  void changeBottomScreen(index){
    currentIndex=index;
    emit(ChangeBottomScreen());
  }
  List<Widget>bottomScreen=const[HomeView(),CategoryView(),CartView(),ProfileView()];
}
