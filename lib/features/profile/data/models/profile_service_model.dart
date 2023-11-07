import 'package:flutter/material.dart';

class ProfileServiceModel {
  final String name;
  final IconData iconName;

  ProfileServiceModel({required this.name, required this.iconName});

  static List<ProfileServiceModel> serviceList = [
    ProfileServiceModel(
      name: "Your account",
      iconName: Icons.person_2_outlined,
    ),
    ProfileServiceModel(
      name: "currency",
      iconName: Icons.credit_card,
    ),
    ProfileServiceModel(
      name: "favorites",
      iconName: Icons.bookmark_outline,
    ),
    ProfileServiceModel(
      name: "Your  address",
      iconName: Icons.location_on_outlined,
    ),
    ProfileServiceModel(
      name: "Language",
      iconName: Icons.language_outlined,
    ),
    ProfileServiceModel(
      name: "Notifications",
      iconName: Icons.notifications,
    ),
    ProfileServiceModel(
      name: "Track order",
      iconName: Icons.fire_truck,
    ),
    ProfileServiceModel(
      name: "Log out",
      iconName: Icons.logout_outlined,
    ),
  ];
}
