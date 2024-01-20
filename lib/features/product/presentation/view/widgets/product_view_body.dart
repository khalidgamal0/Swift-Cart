import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'first_section.dart';
import 'grid_view_item.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const CustomAppbar(
            text: 'Laptops',
            icon: Icons.shopping_cart_outlined,
          ),
          const FirstSection(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: GridView.count(
                physics:const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 24.h,
                crossAxisSpacing: 24.w,
                childAspectRatio: 159.w / 257.h,
                children: List.generate(20, (index) => const ProductGridViewItem(index: 1,)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
