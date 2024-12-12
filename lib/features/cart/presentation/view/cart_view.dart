import 'package:flutter/material.dart';
import 'package:swifit_cart/features/cart/presentation/view/widgets/cart_view_body.dart';

import '../../../../constant.dart';
import '../../../../core/utils/functions/navigator_push.dart';
import '../../../layout/layout_view.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //     onTap: (){
        //       navigatorPush(const LayoutView(), context);
        //     },
        //     child: const Icon(Icons.arrow_back,color: kPrimaryColor,)),
        title: const Text("Your cart"),
      ),
      body: const CartViewBody(),
    );
  }
}
