import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/theme.dart';
import 'features/product_details/presentation/views/product_details_view.dart';

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
        theme: lightTheme,
        home:const ProductDetailsView(),
      ),
    );
  }
}
