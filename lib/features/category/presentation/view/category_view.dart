import 'package:flutter/material.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: Styles.textStyle18,
        ),
      ),
      body: const CategoryViewBody(),
    );
  }
}
