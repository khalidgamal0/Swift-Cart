import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
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
              const Spacer(),
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
          const ResponsiveSizedBox(
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
