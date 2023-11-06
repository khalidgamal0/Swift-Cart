import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';

import 'features/category/presentation/view/category_view.dart';
import 'features/home/presentation/view/home_view.dart';
import 'features/layout/layout_view.dart';
import 'features/product/presentation/view/product_view.dart';

void main() {
  runApp(const SwiftCart());
}

class SwiftCart extends StatelessWidget {
  const SwiftCart({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size (390,844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          iconTheme: const IconThemeData(
            color: kPrimaryColor
          ),
          // textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home:const LayoutView(),
      ),
    );
  }
}
