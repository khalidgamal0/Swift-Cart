import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/address_view_body.dart';

class  AddressView extends StatelessWidget {
  const AddressView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("Address"),
       ),
      body: const AddressViewBody(),
    );
  }
}
