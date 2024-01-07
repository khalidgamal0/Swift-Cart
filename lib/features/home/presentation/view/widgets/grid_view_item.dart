import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/widgets/custom_cached_network_image.dart';
import 'package:swifit_cart/features/home/data/models/home_model.dart';
import 'package:swifit_cart/features/product_details/presentation/views/product_details_view.dart';
import '../../../../../core/utils/styles.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorPush(
            ProductDetailsView(
              id:product.id ,
              isCart:product.inCart ,
              isFavorite: product.inFavorites,
              discount: product.discount,
          name: product.name,
              description: product.description,
              images: product.images,
              oldPrice: product.oldPrice.toString(),
              price: product.price.toString(),

        ), context);
      },
      child: Container(
        height: 250.h,
        width: 160.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              if(product.discount!=0)
              Text(
                '-${product.discount}%',
                style: Styles.textStyle12.copyWith(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              if(product.discount==0)
                SizedBox(
                  height: 18.h,
                ),

              Center(
                child: CustomCashedNetworkImage(
                  imageUrl: product.image,
                  width: double.infinity,
                  height: 144.h,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  if (product.discount != 0)
                    Text(
                      product.oldPrice.toString(),
                      style: Styles.textStyle12.copyWith(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w600,
                        color:  Colors.grey[700],
                      )
                    ),
                  if (product.discount != 0)
                  const Spacer(),
                  Text(
                    '${product.price}\$',
                    style: Styles.textStyle14,
                  ),

                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                product.name,
                style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                  color:  Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
