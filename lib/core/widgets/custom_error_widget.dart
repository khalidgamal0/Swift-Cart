
import 'package:flutter/material.dart';
import 'package:swifit_cart/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(errorMessage,style: Styles.textStyle18,textAlign: TextAlign.center));
  }
}
