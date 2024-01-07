import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/widgets/custom_error_widget.dart';
import 'package:swifit_cart/features/favorite/presentation/manger/favorite_cubit.dart';
import 'favorite_list_view_item.dart';
import 'favorite_loading.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            var cubit = FavoriteCubit.get(context);
            return Column(children: [
              SizedBox(
                height: 20.h,
              ),
              if (state is GetFavoriteSuccess )

                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => FavoriteListItem(
                      favoriteProduct:
                          cubit.favoriteModel!.data!.data![index].product!,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: cubit.favoriteModel!.data?.data?.length ?? 1,
                  ),
                ),
              if (state is FavoriteLoading)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        const FavoriteViewLoading(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: 6,
                  ),
                ),
              if (state is GetFavoriteError || cubit.favoriteModel?.data ==null)
                const CustomErrorWidget(errorMessage: 'kkkkkkk'),
            ]);
          },
        ),
      ),
    );
  }
}
