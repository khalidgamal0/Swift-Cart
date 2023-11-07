import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_radio_container.dart';

class CurrencyViewBody extends StatelessWidget {
  const CurrencyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child:  const Column(
          children: [
            CustomRadioContainer(name: "Dollar", leading: "\$",isSelected: true),
            CustomRadioContainer(name: "Euro", leading: "€", isSelected: false, ),
            CustomRadioContainer(name: "Dollar", leading: "﷼", isSelected: false),
          ],
        ),
      ),
    );
  }
}
