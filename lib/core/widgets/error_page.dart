import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/assets.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import '../../constant.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key,  this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(child: Image.asset(AssetsData.error)),
          const ResponsiveSizedBox(
            height: 40,
          ),
           Text(
            text??'404',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
          const ResponsiveSizedBox(
            height: 40,
          ),
          Text(
            'Ohhh !! It seems like that there '
            'ia a problem loading the page'
            ' .please check your connection and try again.',
            style: Styles.textStyle12
                .copyWith(color: kPrimaryColor.withOpacity(.50)),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
