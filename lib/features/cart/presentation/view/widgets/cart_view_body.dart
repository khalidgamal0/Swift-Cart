import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/cart/presentation/view/widgets/cart_product_container.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return const CartProductContainer();
            },
            separatorBuilder: (context, index) {
              return const ResponsiveSizedBox(
                height: 16,
              );
            },
          ),
          const ResponsiveSizedBox(height: 40,),
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
          const ResponsiveSizedBox(height: 24,),
          const CustomButton(buttonName: "Check out"),
        ],
      ),
    );
  }
}
