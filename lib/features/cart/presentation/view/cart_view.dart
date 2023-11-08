import 'package:flutter/material.dart';
import 'package:swifit_cart/features/cart/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Your cart"),
      ),
      body: CartViewBody(),
    );
  }
}
