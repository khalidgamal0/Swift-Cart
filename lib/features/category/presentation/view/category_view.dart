import 'package:flutter/material.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import '../../../../core/utils/functions/navigator_push.dart';
import '../../../layout/layout_view.dart';
import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //     onTap: (){
        //       navigatorPush(const LayoutView(), context);
        //     },
        //     child: const Icon(Icons.arrow_back,color: kPrimaryColor,)),
        title: Text(
          "Categories",
          style: Styles.textStyle18,
        ),
      ),
      body: const CategoryViewBody(),
    );
  }
}
