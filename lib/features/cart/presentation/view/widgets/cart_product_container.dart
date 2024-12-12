import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/assets.dart';
import 'package:swifit_cart/core/utils/resposive_size_config.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_add_remove_container.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';

import '../../../../../core/utils/functions/navigator_push.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';
import '../../../data/cart_model.dart';
import '../../manger/cart_cubit.dart';

class CartProductContainer extends StatelessWidget {
  const CartProductContainer({super.key, required this.cartProduct});
  final CartProduct cartProduct;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 8.h, horizontal: 14.w),
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
          InkWell(
            onTap:  () {
              navigatorPush(ProductDetailsView(
                  image:cartProduct.image! ,
                  name: cartProduct.name!,
                  description: cartProduct.description!,
                  price: cartProduct.price.toString(),
                  oldPrice: cartProduct.oldPrice.toString(),
                  discount: cartProduct.discount!,
                  isCart:cartProduct.inCart! ,
                  isFavorite:cartProduct.inFavorites! ,
                  id: cartProduct.id!) , context);
            },
            child: Row(
              children: [
                Image.network(
                  cartProduct.image!,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartProduct.name!,
                        maxLines: 2,
                        style: Styles.textStyle12.copyWith(
                          color: kB60Color,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
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
                          )
                        ],
                      ),
                      Text(
                        cartProduct.price!.toString(),
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: kB60Color,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              CartCubit.get(context).changeCart(id:cartProduct.id!);
              CartCubit.get(context).fetchCart();},
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.highlight_remove_outlined,
                size: 30.w,
                color: kB60Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
