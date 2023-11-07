import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/product_details/presentation/views/widgets/product_details_first_sec.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'colors_sec.dart';
import 'list_tile_item.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(
                text: 'Laptops',
                icon: Icons.shopping_cart_outlined,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 24),
                child: Column(
                  children: [
                    const ProductDetailsFirstSec(),
                    const ColorsSec(),
                    const ResponsiveSizedBox(
                      height: 16,
                    ),
                    ListTileItem(
                      onTap: (){},
                      text: 'Product details',
                    ),
                    const ResponsiveSizedBox(
                      height: 32.98,
                    ),
                    ListTileItem(
                      onTap: (){},
                      text: 'shipping details',
                    ),
                    const ResponsiveSizedBox(
                      height: 32.98,
                    ),
                    ListTileItem(
                      onTap: (){},
                      text: 'Return Policy',
                    ),
                    const CustomButton(buttonName: 'Add to cart'),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

