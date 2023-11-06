import 'package:flutter/material.dart';
import 'package:swifit_cart/core/utilis/styles.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, this.onPressed, required this.text, this.textStyle,}) : super(key: key);
  final void Function()? onPressed ;
  final String text;
  final TextStyle? textStyle;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Text(
          text,
         style:textStyle ??  Styles.textStyle20,
      ),
    );
  }
}
