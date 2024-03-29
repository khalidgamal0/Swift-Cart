import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:swifit_cart/core/utils/network/dio.dart';
import 'package:swifit_cart/features/search/data/repo/search_repo_impl.dart';

import '../../features/adress/data/repo/address_repo_fimpl.dart';
import '../../features/auth/data/repos/auth_repo_implementaion.dart';
import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/favorite/data/repo/favorite_repo_impl.dart';
import '../../features/home/data/repos/home_repo_implementation.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<AddressRepoImpl>(
    AddressRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<FavoriteRepoImpl>(
    FavoriteRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
