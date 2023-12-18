import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/widgets/custom_cached_network_image.dart';
import 'package:swifit_cart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:swifit_cart/features/product_details/presentation/views/product_details_view.dart';
import '../../../../../core/utils/styles.dart';

class ProductsGridViewItem extends StatelessWidget {
  const ProductsGridViewItem({
    super.key, required this.index, required this.cubit,
  });


  final int index;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorPush(
            ProductDetailsView(
              discount: cubit.categoryProductsModel!.data.data[index].discount,
              name: cubit.categoryProductsModel!.data.data[index].name,
              description: cubit.categoryProductsModel!.data.data[index]
                  .description,
              images: cubit.categoryProductsModel!.data.data[index].images,
              oldPrice: cubit.categoryProductsModel!.data.data[index].oldPrice
                  .toString(),
              price: cubit.categoryProductsModel!.data.data[index].price
                  .toString(),
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
          padding: EdgeInsets.symmetric(horizontal: 8.0.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              if(cubit.categoryProductsModel!.data.data[index].discount != 0)
                Text(
                  '-${cubit.categoryProductsModel!.data.data[index].discount}%',
                  style: Styles.textStyle12.copyWith(
                    color: Colors.red,
                  ),
                ),
              SizedBox(
                height: 8.h,
              ),
              if(cubit.categoryProductsModel!.data.data[index].discount == 0)
                SizedBox(
                  height: 18.h,
                ),

              Center(
                child: CustomCashedNetworkImage(
                  imageUrl: cubit.categoryProductsModel!.data.data[index].image,
                  width: double.infinity,
                  height: 144.h,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  if (cubit.categoryProductsModel!.data.data[index].discount !=
                      0)
                    Text(
                        cubit.categoryProductsModel!.data.data[index].oldPrice
                            .toString(),
                        style: Styles.textStyle12.copyWith(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        )
                    ),
                  if (cubit.categoryProductsModel!.data.data[index].discount !=
                      0)
                    const Spacer(),
                  Text(
                    '${cubit.categoryProductsModel!.data.data[index].price}\$',
                    style: Styles.textStyle14,
                  ),

                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                cubit.categoryProductsModel!.data.data[index].name,
                style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }}
