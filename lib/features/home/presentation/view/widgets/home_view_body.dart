import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:swifit_cart/features/home/presentation/view/home_view_loading.dart';
import 'package:swifit_cart/features/search/presentation/view/search_view.dart';
import 'banners_sec.dart';
import 'category_list_view.dart';
import 'grid_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const  HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition:
              homeCubit.homeModel != null && homeCubit.categoriesModel != null,
          builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 8.h),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ResponsiveSizedBox(
                  height: 6,
                ),
                BannersSec(
                  banners: homeCubit.homeModel!.data.banners,
                ),
                const ResponsiveSizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child:  CustomTextFormField(
                    onTap: (){
                      navigatorPush(const SearchView(), context);
                    },
                    hintText: 'Search',
                    suffix: Icons.search_rounded,
                    boarderRadius: 40,
                  ),
                ),
                const ResponsiveSizedBox(
                  height: 29,
                ),
                CategoryListView(
                  categoriesModel: homeCubit.categoriesModel!,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 21.w, vertical: 20.h),
                  child: Text(
                    'Best Seller',
                    style: Styles.textStyle20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 13.w,
                    childAspectRatio: 160 / 250,
                    children: List.generate(
                      homeCubit.homeModel!.data.products.length,
                      (index) => HomeGridViewItem(
                        product: homeCubit.homeModel!.data.products[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          fallback: (context) =>  const HomeViewLoading(),
        );
      },
    );
  }
}




