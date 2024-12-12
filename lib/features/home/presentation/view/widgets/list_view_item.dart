import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_cached_network_image.dart';
import 'package:swifit_cart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '../../../../../core/utils/functions/navigator_push.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/presentation/view/category_products_view.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.image,
    required this.name, required this.index,
  });

  final String image;
  final String name;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomeCubit.get(context).fetchCategoryProductsData(
          id: HomeCubit.get(context).categoriesModel!.data.data[index].id
              .toString(),
        );

        navigatorPush(
          CategoryProductView(
            categoryName: HomeCubit.get(context).categoriesModel!.data.data[index].name,
          ),
          context,
        );
      },
      child: SizedBox(
        height: 100.5.h,
        width: 80.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 80.w,
                  height: 88.h,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 7.h,),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(
                        0xff2A132E,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(9.89.r),
                  ),
                  child: Text(
                    name,
                    style: Styles.textStyle12,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            CustomCashedNetworkImage(
              width: 65.w,
              height: 50.h,
              imageUrl: image,
            ),
          ],
        ),
      ),
    );
  }
}
