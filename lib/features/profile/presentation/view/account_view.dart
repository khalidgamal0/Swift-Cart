import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/account_view_body.dart';

import '../../../auth/presentation/manager/auth_cubit.dart';
import '../manger/profile_cubit.dart';

class  AccountView extends StatelessWidget {
  const AccountView ({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("My account"),
       ),
      body:   const AccountViewBody(),
    );
  }
}
