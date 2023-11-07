import 'package:flutter/material.dart';
import 'package:swifit_cart/core/utils/styles.dart';

import '../../../../../core/constant.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key, required this.text, required this.onTap,
  });
final String text;
final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: Styles.textStyle18.copyWith(
          fontWeight: FontWeight.w400,
          color: kPrimaryColor.withOpacity(.75),
        ),
      ),
      trailing:InkWell(
        onTap: onTap,
        child: Icon(Icons.arrow_downward,
          color: kPrimaryColor.withOpacity(.75),
          size:16,
        ),
      ),

    );
  }
}
