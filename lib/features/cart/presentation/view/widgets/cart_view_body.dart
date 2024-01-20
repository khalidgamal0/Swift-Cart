import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/cart/presentation/manger/cart_cubit.dart';
import 'package:swifit_cart/features/cart/presentation/view/widgets/cart_product_container.dart';

import 'cart_view_loading.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit.get(context).fetchCart();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          var cubit = CartCubit.get(context);

          return state is GetCartLoading
              ? SizedBox(
            height:MediaQuery.of(context).size.height,
                child: ListView.separated(
                    itemBuilder: (context, index) => const CartViewLoading(),
                    separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                    itemCount: 5,
                  ),
              )
              : state is GetCartSuccess
                  ? Column(
                      children: [
                        if (cubit.cartModel!.data!.cartItems!.isEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: 200.h),
                            child: Text(
                              "No cart have been\n added yet",
                              style: Styles.textStyle20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.cartModel!.data!.cartItems!.length,
                          itemBuilder: (context, index) {
                            return CartProductContainer(
                              cartProduct: cubit
                                  .cartModel!.data!.cartItems![index].product!,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const ResponsiveSizedBox(
                              height: 16,
                            );
                          },
                        ),
                        const ResponsiveSizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total :",
                              style: Styles.textStyle18.copyWith(
                                color: kB60Color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "\$ 874.99",
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: kB60Color,
                              ),
                            ),
                          ],
                        ),
                        const ResponsiveSizedBox(
                          height: 24,
                        ),
                        const CustomButton(buttonName: "Check out"),
                      ],
                    )
                  : Center(
                      child: Text(
                        "an error happen Please try again",
                        style: Styles.textStyle20,
                        textAlign: TextAlign.center,
                      ),
                    );
        },
      ),
    );
  }
}
