import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/bloc_observer.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/utils/theme.dart';
import 'package:swifit_cart/features/auth/presentation/views/sign_up_view.dart';
import 'package:swifit_cart/features/layout/layout_view.dart';

import 'core/utils/service_locator.dart';
import 'core/utils/shared_prefrence.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: child,
        );
      },
      designSize:const Size (390,844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: token !=null ? const SignUpView(): const LayoutView(),
    );
  }
}
