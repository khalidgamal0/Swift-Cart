import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/features/product_details/presentation/views/product_details_view.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/resposive_size_config.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';
import '../../../data/favorite_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({
    super.key,
    required this.favoriteProduct,
    required this.onTap,
  });

  final Product favoriteProduct;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorPush(
            ProductDetailsView(
              image: favoriteProduct.image!,
              name: favoriteProduct.name!,
              description: favoriteProduct.description!,
              price: favoriteProduct.price.toString(),
              oldPrice: favoriteProduct.oldPrice.toString(),
              discount: favoriteProduct.discount!,
              id: favoriteProduct.id!,
              isFavorite: false,
              isCart: false,
            ),
            context);
      },
      child: Container(
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 14.w),
        height: 130.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Row(
          children: [
            Image.network(
              favoriteProduct.image!,
              width: 96.w,
              height: 104.h,
              fit: BoxFit.fill,
            ),
            const ResponsiveSizedBox(
              width: 16,
            ),
            SizedBox(
              width: SizeConfig.width(context, 120),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.0.h, bottom: 5.h),
                    child: Text(
                      favoriteProduct.name!,
                      maxLines: 2,
                      style: Styles.textStyle12.copyWith(
                        color: kB60Color,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Text(
                      favoriteProduct.price!.toString(),
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kB60Color,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onTap,
                child: Icon(
                  Icons.delete,
                  size: 24.w,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
