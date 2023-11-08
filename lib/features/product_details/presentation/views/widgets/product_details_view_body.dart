import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/product_details/presentation/views/widgets/product_details_first_sec.dart';
import '../../../../../core/constant.dart';
import '../../../../../core/utils/styles.dart';
import 'colors_sec.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductDetailsFirstSec(),
            const ColorsSec(),
            const ResponsiveSizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Product details',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w400,
                    color:isDown?kPrimaryColor: kPrimaryColor.withOpacity(.75),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isDown = !isDown;
                    });
                  },
                  icon: Icon(
                    isDown ?Icons.arrow_upward:Icons.arrow_downward,
                    color: kPrimaryColor.withOpacity(.75),
                    size: 16,
                  ),
                )
              ],
            ),
            if (isDown == true)
              Text(
                text,
                style: Styles.textStyle16,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),
            const ResponsiveSizedBox(
              height: 32.98,
            ),
            const Spacer(),
            const CustomButton(buttonName: 'Add to cart'),
            const ResponsiveSizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
