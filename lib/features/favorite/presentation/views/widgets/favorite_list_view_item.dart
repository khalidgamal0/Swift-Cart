import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/resposive_size_config.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';
import '../../../data/favorite_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({
    super.key, required this.favoriteProduct,
  });
final Product favoriteProduct;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset(
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
            child: Icon(
              Icons.favorite_outline,
              size: 24.w,
              color: kB60Color,
            ),
          ),
        ],
      ),
    );
  }
}
