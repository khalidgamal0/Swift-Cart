import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_row_service_container.dart';
import '../../../../adress/presentation/view/address_screen.dart';
import '../../../../favorite/presentation/views/favorite_view.dart';
import '../account_view.dart';
import '../currency_view.dart';
import '../language_view.dart';
import '../logout_view.dart';
import '../notification_view.dart';

class ProfileContainerItem extends StatelessWidget {
  const ProfileContainerItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowServiceContainer(
          onPressed: () {
             navigatorPush(const AccountView(), context);
          },
          name: "Your account",
          iconName: Icons.person_2_outlined,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(
            height: 1.h,
            color: kB60Color,
            thickness: 1.w,
          ),
        ),
        CustomRowServiceContainer(
            onPressed: () {
              navigatorPush(const CurrencyView(), context);


            },
            name: "currency",
            iconName: Icons.credit_card,
           ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(
            height: 1.h,
            color: kB60Color,
            thickness: 1.w,
          ),
        ),
        CustomRowServiceContainer(
            onPressed: () {
              navigatorPush(const FavouriteView(),context);
            },
            name: "favorites",
            iconName: Icons.bookmark_outline,
            ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(
            height: 1.h,
            color: kB60Color,
            thickness: 1.w,
          ),
        ),
        CustomRowServiceContainer(
            onPressed: () {
              navigatorPush(const AddressScreen(),context);
            },
            name: "Your  address",
            iconName: Icons.location_on_outlined,
            ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(
            height: 1.h,
            color: kB60Color,
            thickness: 1.w,
          ),
        ),
        CustomRowServiceContainer(
            onPressed: () {
              navigatorPush(const LanguageView(),context);
            },
            name: "Language",
            iconName: Icons.language_outlined,
            ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(
            height: 1.h,
            color: kB60Color,
            thickness: 1.w,
          ),
        ),
        CustomRowServiceContainer(
            onPressed: () {
              navigatorPush(const NotificationView(),context);
            },
            name: "Notifications",
            iconName: Icons.notifications,
            ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Divider(
            height: 1.h,
            color: kB60Color,
            thickness: 1.w,
          ),
        ),
        CustomRowServiceContainer(
            onPressed: () {
              navigatorPush(const LogOutView(),context);
            },
            name: "Log out",
            iconName: Icons.logout_outlined,
            ),
      ],
    );
  }
}
