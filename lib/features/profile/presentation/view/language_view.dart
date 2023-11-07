import 'package:flutter/material.dart';
import 'package:swifit_cart/features/profile/presentation/view/widgets/language_view_body.dart';

class  LanguageView extends StatelessWidget {
  const LanguageView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("Language"),
       ),
      body: const LanguageViewBody(),
    );
  }
}
