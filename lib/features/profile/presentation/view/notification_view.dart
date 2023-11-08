import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const NotificationViewBody(),
    );
  }
}
