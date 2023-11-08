import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/profile_view_body.dart';

class  ProfileView extends StatelessWidget {
  const ProfileView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("Profile"),
       ),
      body: const ProfileViewBody(),
    );

  }
}
