import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/theme.dart';
import 'features/search/presentation/view/widgets/search_view_body.dart';


void main() {
  runApp(const SwiftCart());
}

class SwiftCart extends StatelessWidget {
  const SwiftCart({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: child,
        );
      },
      designSize:const Size (390,844),
      minTextAdapt: true,
      splitScreenMode: true,
      child:  SearchViewBody(),
    );
  }
}
