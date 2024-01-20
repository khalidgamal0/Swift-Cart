import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/features/favorite/presentation/manger/favorite_cubit.dart';
import '../../../../../core/utils/styles.dart';
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

            if (state is GetFavoriteLoading||state is ChangeFavoriteLoading) {
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
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
                ]);
            }
            if (state is GetFavoriteSuccess) {
              return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    if(cubit.favoriteModel!.data!.total==0)
                      Padding(
                        padding:  EdgeInsets.only(top:200.h),
                        child: Text(
                          "No Favorite have been\n added yet",
                          style: Styles.textStyle20,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => FavoriteListItem(
                          onTap: (){
                            cubit.changeFavorite(id: cubit.favoriteModel!.data!.data![index].product!.id!);
                          },
                          favoriteProduct:
                          cubit.favoriteModel!.data!.data![index].product!,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: cubit.favoriteModel!.data?.data?.length ?? 1,
                      ),
                    ),
                  ]);
            }
            else {
              return  Center(
                child: Text(
                  "an error happen Please try again",
                  style: Styles.textStyle20,
                  textAlign: TextAlign.center,
                ),
              );

          }


          },
        ),
      ),
    );
  }
}
