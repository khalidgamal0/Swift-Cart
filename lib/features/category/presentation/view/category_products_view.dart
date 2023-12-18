import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_error_widget.dart';
import 'package:swifit_cart/features/category/presentation/view/widgets/products_grid_view_item.dart';
import 'package:swifit_cart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:swifit_cart/features/home/presentation/view/widgets/home_grid_view_item_loading.dart';

class CategoryProductView extends StatelessWidget {
  const CategoryProductView({super.key, required this.categoryName,});
  final String categoryName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(categoryName),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit=HomeCubit.get(context);
          if(state is CategoryProductsLoading){
            return   Padding(
              padding:  EdgeInsets.symmetric(horizontal: 21.0.h ,vertical: 5.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 13.w,
                  childAspectRatio: 160 / 250,
                ),
                itemBuilder: (context, index) => const HomeGridViewItemLoading(),
                itemCount: 6,
              ),
            );
          }else if(state is CategoryProductsSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 5.h),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 13.w,
                childAspectRatio: 160 / 250,
                children: List.generate(
                  HomeCubit
                      .get(context)
                      .categoryProductsModel!
                      .data
                      .data
                      .length,
                      (index) =>
                      ProductsGridViewItem(
                        index: index, cubit: cubit,
                      ),
                ),
              ),
            );
          }else{
            return  Center(child: CustomErrorWidget(errorMessage: state is CategoryProductsFailure ? state.errorMessage : ""));
          }
        },
      ),
    );
  }
}
