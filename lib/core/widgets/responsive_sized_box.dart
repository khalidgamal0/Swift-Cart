import 'package:flutter/material.dart';
import 'package:swifit_cart/core/utilis/resposive_size_config.dart';

class ResponsiveSizedBox extends StatelessWidget {
  const ResponsiveSizedBox({super.key, this.height, this.width, this.child});
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height(context, height ??0),
      width: SizeConfig.width(context, width ??0),
      child: child,
    );
  }
}
