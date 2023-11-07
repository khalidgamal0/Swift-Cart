import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/features/auth/presentation/views/sign_up_view.dart';


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
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              titleTextStyle: Styles.textStyle18.copyWith(
                color: kB60Color,
                fontWeight: FontWeight.w600,
              ),
              centerTitle: true,
              iconTheme: IconThemeData(color: kPrimaryColor, size: 24.w),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: kSecondaryColor,
              elevation: 0,
              toolbarHeight:
              64.h,
            ),
          ),
          home:child,
        );
      },

      child:const SignUpView() ,
    );
  }
}
