import 'package:flutter/material.dart';
import 'package:swifit_cart/features/home/presentation/view/widgets/home_view_body.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swifit_cart/core/utils/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(FontAwesomeIcons.listCheck),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(FontAwesomeIcons.store),
            SizedBox(
              width: 14.w,
            ),
            Text(
              'Home',
              style: Styles.textStyle18,
            ),
            SizedBox(
              width: 50.w,
            ),
          ],
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
