import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_error_widget.dart';
import 'package:swifit_cart/features/category/presentation/view/category_view_loading.dart';
import 'package:swifit_cart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'cat_list_view_item.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const CategoryViewLoading();
        }
        else if (state is CategoriesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        CatListViewItem(
                          index: index,

                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 24.h,
                        ),
                    itemCount: HomeCubit
                        .get(context)
                        .categoriesModel!
                        .data
                        .data
                        .length,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
