import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utilis/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 25.w,
      ),
      const Icon(FontAwesomeIcons.listCheck),
      SizedBox(
        width: 96.w,
      ),
      const Icon(FontAwesomeIcons.store),
      SizedBox(
        width: 16.w,
      ),
      Text(
        'Home',
        style: Styles.textStyle18,
      )
    ]);
  }
}
