import 'package:flutter/material.dart';
import 'package:swifit_cart/features/favorite/presentation/views/widgets/favorite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: const FavouriteViewBody(),
    );
  }
}
