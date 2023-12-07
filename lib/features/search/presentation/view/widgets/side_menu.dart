import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant.dart';import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/side_menu_brands.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/slider_section.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 16.w),
          child: ListView(
            children: <Widget>[
              Container(
                height: 46.h,
                color: kSecondaryColor,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_circle_left_outlined)),
                    const ResponsiveSizedBox(
                      width: 24,
                    ),
                    Text(
                      'Filters',
                      style: Styles.textStyle20,
                    )
                  ],
                ),
              ),
              const ResponsiveSizedBox(
                height: 40,
              ),
              Text(
                'Brands:',
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
              ),
              const SideMenuBrands(),
              Text(
                'Price range:',
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const ResponsiveSizedBox(
                height: 16,
              ),
              const SliderSection(),
              const ResponsiveSizedBox(
                height: 100,
              ),
              CustomButton(buttonName: 'Search',onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }
}


