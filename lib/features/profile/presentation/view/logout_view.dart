import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/log_out_view_body.dart';

class LogOutView extends StatelessWidget {
  const LogOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Log out"),
      ),
      body: const LogOutViewBody(),
    );
  }
}
