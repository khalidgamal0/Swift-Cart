import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/functions/navigator_push.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/manager/home_cubit/home_cubit.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';
import '../../../../search/data/searchModel.dart';

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({
    super.key,
    this.datumSearch,
    this.isSearch = true,
    required this.index,
  });

  final DatumSearch? datumSearch;
  final bool isSearch;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit.get(context).fetchHomeData();
        return GestureDetector(
          onTap: () {
            navigatorPush(
                ProductDetailsView(
                  image:datumSearch!.image! ,
                  isFavorite:HomeCubit.get(context)
                      .homeModel!
                      .data
                      .products[index]
                      .inFavorites,
                  isCart: datumSearch!.inCart,
                  id: datumSearch!.id!,
                  discount: 0,
                  name: datumSearch!.name!,
                  description: datumSearch!.description!,
                  images: datumSearch!.images!,
                  oldPrice: 0.toString(),
                  price: datumSearch!.price!.toString(),
                ),
                context);
          },
          child: Container(
            width: 159.w,
            height: 257.h,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xff2A132E).withOpacity(.5)),
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff2A132E).withOpacity(.1),
            ),
            child: Column(children: [
              Padding(
                padding:
                EdgeInsets.only(bottom: 8.0.h, left: 8.w, right: 7.w, top: 8.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      size: 20.w,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add_box_rounded,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
              Image.network(
                datumSearch!.image!,
                height: 144.h,
                width: 144.w,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 8.0.w,
                  ),
                  if (!isSearch)
                    Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: Text(
                        '593.97 \$',
                        style: Styles.textStyle12.copyWith(
                          decoration: TextDecoration.lineThrough,
                          height: 1.2.h,
                        ),
                      ),
                    ),
                  Text(
                    datumSearch!.price!.toString(),
                    style: Styles.textStyle12.copyWith(
                      color: kPrimaryColor,
                      height: 1.2.h,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 6,
                  bottom: 8,
                ),
                child: SizedBox(
                  height: 38.h,
                  child: Text(
                    datumSearch!.description!,
                    style: Styles.textStyle12,
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
