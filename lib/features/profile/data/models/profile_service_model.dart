import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/account_view.dart';
import 'package:swifit_cart/features/profile/presentation/view/address_view.dart';
import 'package:swifit_cart/features/profile/presentation/view/currency_view.dart';
import 'package:swifit_cart/features/profile/presentation/view/favourite_view.dart';
import 'package:swifit_cart/features/profile/presentation/view/language_view.dart';
import 'package:swifit_cart/features/profile/presentation/view/logout_view.dart';
import 'package:swifit_cart/features/profile/presentation/view/notification_view.dart';

class ProfileServiceModel {
  final String name;
  final IconData iconName;
  final Widget navigaterPage;

  ProfileServiceModel( {required this.navigaterPage,required this.name, required this.iconName});

  static List<ProfileServiceModel> serviceList = [
    ProfileServiceModel(
      navigaterPage: const AccountView(),
      name: "Your account",
      iconName: Icons.person_2_outlined,
    ),
    ProfileServiceModel(
      navigaterPage: const CurrencyView(),
      name: "currency",
      iconName: Icons.credit_card,
    ),
    ProfileServiceModel(
      navigaterPage: const FavouriteView(),
      name: "favorites",
      iconName: Icons.bookmark_outline,
    ),
    ProfileServiceModel(
      navigaterPage: const AddressView(),
      name: "Your  address",
      iconName: Icons.location_on_outlined,
    ),
    ProfileServiceModel(
      navigaterPage: const LanguageView(),
      name: "Language",
      iconName: Icons.language_outlined,
    ),
    ProfileServiceModel(
          navigaterPage: const NotificationView(),
      name: "Notifications",
      iconName: Icons.notifications,
    ),
    ProfileServiceModel(
      navigaterPage: const LogOutView(),
      name: "Log out",
      iconName: Icons.logout_outlined,
    ),
  ];

}
