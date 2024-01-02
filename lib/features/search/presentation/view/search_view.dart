import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swifit_cart/core/utils/service_locator.dart';
import 'package:swifit_cart/features/search/presentation/manger/search_cubit.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/search_view_body.dart';

import '../../data/repo/search_repo_impl.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: const SearchViewBody(),
    );
  }
}
