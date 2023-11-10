import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';

class SliderSection extends StatelessWidget {
  const SliderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.h,
      width: 289,
      padding: const EdgeInsets.symmetric(horizontal:10,vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor.withOpacity(.25),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
          children: [
            SizedBox(
              height: 15.h,
              child: SliderTheme(
                data: SliderThemeData(
                    trackHeight: 2.h,
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 6.w,
                    )
                ),
                child: Slider(
                  value: 2000,
                  max: 3000,
                  min: 120,
                  onChanged: (value) {},
                  activeColor: kPrimaryColor,
                  inactiveColor:kPrimaryColor.withOpacity(.25),

                ),
              ),
            ),
            const ResponsiveSizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20.h,
              child: Row(children: [
                Text('120 \$',style: Styles.textStyle12,),
                const Spacer(),
                Text('3000 \$',style: Styles.textStyle12,),
              ],),
            )


          ]),
    );
  }
}
