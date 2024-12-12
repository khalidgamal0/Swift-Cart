import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/widgets/custom_cached_network_image.dart';
import 'package:swifit_cart/features/category/presentation/view/category_products_view.dart';
import 'package:swifit_cart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class CatListViewItem extends StatelessWidget {
  const CatListViewItem({
    super.key, this.onTap, required this.index,
  });

  final void Function()? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.fetchCategoryProductsData(
              id: cubit.categoriesModel!.data.data[index].id
                  .toString(),
            );

            navigatorPush(
              CategoryProductView(
                categoryName: cubit.categoriesModel!.data.data[index].name,
              ),
              context,
            );
          },
          child: Container(
            height: 72.h,
            margin: EdgeInsets.symmetric(horizontal: 23.w),
            width: 344.w,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff2A132E).withOpacity(.05)),
              borderRadius: BorderRadius.circular(8),
              color: kSecondaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                CustomCashedNetworkImage(
                  imageUrl: cubit.categoriesModel!.data.data[index].image, height: 60.h, width: 60.w,),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  cubit.categoriesModel!.data.data[index].name,
                  style: Styles.textStyle18,
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 18.w,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
