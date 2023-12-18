import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/product_details/presentation/views/widgets/product_details_first_sec.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';
import 'colors_sec.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody(
      {Key? key,
      required this.images,
      required this.name,
      required this.description,
      required this.price,
      required this.oldPrice, required this.discount})
      : super(key: key);
  final List<String> images;
  final String name;
  final String description;
  final String price;
  final String oldPrice;
  final int discount;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsFirstSec(
              discount: widget.discount,
              images: widget.images,
              price: widget.price,
              name: widget.name,
              oldPrice: widget.oldPrice,
            ),
            const ColorsSec(),
            const ResponsiveSizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'Product details',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        isDown ? kPrimaryColor : kPrimaryColor.withOpacity(.90),
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
                    isDown ? Icons.arrow_upward : Icons.arrow_downward,
                    color: kPrimaryColor.withOpacity(.75),
                    size: 16,
                  ),
                )
              ],
            ),
            if (isDown == true)
              Text(
                widget.description,
                style: Styles.textStyle16.copyWith(
                  color: Colors.grey[800]
                ),
                textAlign: TextAlign.start,
              ),
            const ResponsiveSizedBox(
              height: 32.98,
            ),
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
