import 'package:flutter/material.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/features/layout/layout_view.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/profile_view_body.dart';

import '../../../../constant.dart';

class  ProfileView extends StatelessWidget {
  const ProfileView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: GestureDetector(
             onTap: (){
               navigatorPush(const LayoutView(), context);
             },
             child: const Icon(Icons.arrow_back,color: kPrimaryColor,)),
         title: const Text("Profile"),
       ),
      body: const ProfileViewBody(),
    );

  }
}
