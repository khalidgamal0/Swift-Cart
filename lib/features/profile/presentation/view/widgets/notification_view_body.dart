import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/constant.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {

  bool notify = false;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          Row(
            children: [
              Text("Send Notifications",
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500
                ),
              ),
              Spacer(),
              Transform.scale(
                scale: 1.2,
                child: Switch(
                  activeColor: Colors.white,
                  value: notify,
                  activeTrackColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(
                          () {
                        notify = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          ResponsiveSizedBox(
            height: 8,
          ),
          Text("turning on notification means that you will receive our offers and news directly to your phone.",
            style: Styles.textStyle12.copyWith(
                fontWeight: FontWeight.w400,
              color: kB60Color,
            ),
          ),
        ],
      ),
    );
  }
}
