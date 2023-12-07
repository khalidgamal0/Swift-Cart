
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:swifit_cart/core/utils/network/dio.dart';

import '../../features/auth/data/repos/auth_repo_implementaion.dart';

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
}
