import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/bloc_observer.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/network/dio.dart';
import 'package:swifit_cart/core/utils/theme.dart';
import 'package:swifit_cart/features/auth/presentation/views/sign_up_view.dart';
import 'package:swifit_cart/features/home/data/repos/home_repo_implementation.dart';
import 'package:swifit_cart/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:swifit_cart/features/layout/layout_view.dart';
import 'package:swifit_cart/generated/l10n.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/shared_prefrence.dart';
import 'features/adress/data/repo/address_repo_fimpl.dart';
import 'features/adress/presentation/manger/address_cubit.dart';
import 'features/auth/data/repos/auth_repo_implementaion.dart';
import 'features/auth/presentation/manager/auth_cubit.dart';
import 'features/profile/data/repo/profile_repo_impl.dart';
import 'features/profile/presentation/manger/account/account_cubit.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  DioHelper.init();
  await SharedPreference.init();
  token = SharedPreference.getData(key: 'token');
  runApp(const SwiftCart());
}

class SwiftCart extends StatelessWidget {
  const SwiftCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
              AddressCubit(getIt.get<AddressRepoImpl>())..fetchAddress(),
            ),
            BlocProvider(
              create: (context) =>
              HomeCubit(getIt.get<HomeRepoImpl>())..fetchHomeData()..fetchCategoriesData(),
            ),
            BlocProvider(
              create: (context) => AccountCubit(getIt.get<ProfileRepoImpl>()),
            )
          ],
          child: MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: child,
          ),
        );
      },
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: token == null ? const SignUpView() : const LayoutView(),
    );
  }
}
