import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/features/favorite/presentation/views/widgets/favorite_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo/favorite_repo_impl.dart';
import '../manger/favorite_cubit.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: BlocProvider(
        create: (context) => FavoriteCubit(getIt.get<FavoriteRepoImpl>())..getFavorite(),
        child: const FavouriteViewBody(),
      ),
    );
  }
}
