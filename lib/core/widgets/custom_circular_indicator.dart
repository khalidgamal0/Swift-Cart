import 'package:flutter/material.dart';
import 'package:swifit_cart/constant.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key, this.height, this.width, this.color,
  });
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: height,
        width: width,
        child:  CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
