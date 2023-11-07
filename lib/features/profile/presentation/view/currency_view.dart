import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/currency_view_body.dart';

class  CurrencyView extends StatelessWidget {
  const CurrencyView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("Currency"),
       ),
      body: const CurrencyViewBody(),
    );
  }
}
