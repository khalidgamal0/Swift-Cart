import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/features/layout/layout_view.dart';
import 'package:swifit_cart/features/search/presentation/manger/search_cubit.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/search_shimmer.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/success_search_zero_result.dart';
import '../../../../../constant.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/search_container.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/side_menu.dart';
import '../../../../product/presentation/view/widgets/grid_view_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          drawer: const NavDrawer(),
          key: cubit.key,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              navigatorPush(const LayoutView(), context);
                            },
                            child: const Icon(Icons.arrow_circle_left_outlined)),
                        const ResponsiveSizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            controller: cubit.searchController,
                            type: TextInputType.name,
                            onChange: (value) {
                              cubit.fetchSearch(text: value);
                            },
                            hintText: 'Search',
                            suffix: Icons.search,
                            boarderRadius: 40.w,
                            fillColor: kPrimaryColor.withOpacity(.05),
                          ),
                        ),
                      ],
                    ),
                    const ResponsiveSizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              cubit.key.currentState!.openDrawer();
                            },
                            child: const SearchContainer(word: 'Filters')),
                        const ResponsiveSizedBox(
                          width: 24,
                        ),
                        const SearchContainer(word: 'ALL'),
                      ],
                    ),
                    const ResponsiveSizedBox(
                      height: 16,
                    ),
                    if (state is SearchSuccess &&
                        cubit.searchModel?.data?.total != 0 &&
                        cubit.searchController.text != '')
                      GridView.count(
                        shrinkWrap: true,
                        physics:  const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 24.h,
                        crossAxisSpacing: 24.w,
                        childAspectRatio: 159.w / 257.h,
                        children: List.generate(
                            cubit.searchModel!.data!.total!,
                            (index) => ProductGridViewItem(
                                isSearch: true,
                                index: index,
                                datumSearch:
                                    cubit.searchModel!.data!.data![index])),
                      ),
                    if (cubit.searchModel?.data?.total == 0 ||
                        cubit.searchModel?.data?.total == null ||
                        cubit.searchController.text == '')
                      const SuccessSearchZeroResult(),
                    if (state is SearchLoading)
                      GridView.count(
                        shrinkWrap: true,
                        physics:  const NeverScrollableScrollPhysics(),                      crossAxisCount: 2,
                        mainAxisSpacing: 24.h,
                        crossAxisSpacing: 24.w,
                        childAspectRatio: 159.w / 257.h,
                        children: List.generate(
                          6,
                          (index) => const ShimmerSearch(),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
