import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_add_remove_container.dart';
import 'package:swifit_cart/core/widgets/custom_cached_network_image.dart';
import 'package:swifit_cart/features/favorite/presentation/manger/favorite_cubit.dart';
import '../../../../../constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';

class ProductDetailsFirstSec extends StatelessWidget {
  const ProductDetailsFirstSec({
    super.key,
    required this.images,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.isFavorite,
    required this.isCart,
    required this.id, required this.image,  this.fromFavorite=true,
  });

  final List<String>? images;
  final String name;
  final String price;
  final String image;
  final String oldPrice;
  final int discount;
  final bool isFavorite;
  final bool isCart;
  final bool fromFavorite;
  final int id;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: double.infinity,
              height: 296.h,
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: images?.length??1,
                itemBuilder: (context, index) {
                  return CustomCashedNetworkImage(
                    imageUrl: images?[index]??image, width: 390.w,
                    height: 296.h,);
                },
              ),
            ),

            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                var cubit=FavoriteCubit.get(context);
                return GestureDetector(
                  onTap: () {
                    cubit.changeFavorite(id: id);
                  },
                  child: Icon(
                   cubit.changeFavoriteModel?.message =='Added Successfully'|| isFavorite ? Icons.favorite : Icons.favorite_outline,
                    size: 28.w,
                  ),
                );
              },
            )
          ],
        ),
        const ResponsiveSizedBox(
          height: 20,
        ),
        Center(
          child: SmoothPageIndicator(
            controller: pageController,
            count: images?.length??1,
            effect: const ExpandingDotsEffect(
              dotColor: Colors.grey,
              dotHeight: 6,
              dotWidth: 10,
              spacing: 6,
              activeDotColor: kPrimaryColor,
            ),
          ),
        ),
        const ResponsiveSizedBox(
          height: 20,
        ),
        Text(
          name,
          style: Styles.textStyle18,
        ),
        const ResponsiveSizedBox(
          height: 8,
        ),
        Row(
          children: [
            if (discount != 0)
              Padding(
                padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
                child: Text(
                  '$oldPrice \$',
                  style: Styles.textStyle12.copyWith(
                    color: kPrimaryColor.withOpacity(.75),
                    decoration: TextDecoration.lineThrough,
                    height: 1.2.h,
                  ),
                ),
              ),
            Text(
              '$price \$',
              style: Styles.textStyle12.copyWith(
                color: kPrimaryColor,
                height: 1.2.h,
              ),
            ),
            const Spacer(),
            const CustomAddRemoveContainer(
              icon: Icons.remove,
            ),
            ResponsiveSizedBox(
              width: 8.w,
            ),
            Text(
              '1',
              style: Styles.textStyle16,
            ),
            ResponsiveSizedBox(
              width: 8.w,
            ),
            const CustomAddRemoveContainer(
              icon: Icons.add,
            ),
          ],
        ),
        const ResponsiveSizedBox(
          height: 22,
        ),
        Divider(
          height: 1,
          color: kPrimaryColor.withOpacity(.25),
        ),
        const ResponsiveSizedBox(
          height: 16,
        ),
        Text(
          'Colors',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w400,
            color: kPrimaryColor.withOpacity(.75),
          ),
        ),
        const ResponsiveSizedBox(
          height: 8,
        ),
      ],
    );
  }
}
