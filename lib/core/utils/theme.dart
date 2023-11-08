import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';




ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 24.w),
      unselectedIconTheme: IconThemeData(size: 24.w),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kSecondaryColor,
      selectedItemColor: kPrimaryColor,
      elevation: 0,
      unselectedItemColor: kB60Color,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: Styles.textStyle18.copyWith(
        color: kPrimaryColor,
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
    iconTheme: IconThemeData(size: 24.w),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins"
);

