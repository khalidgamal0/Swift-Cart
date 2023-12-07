import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constant.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/search_container.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/search_grid_view.dart';
import 'package:swifit_cart/features/search/presentation/view/widgets/side_menu.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
// Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      key: _key,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){},
                      child: const Icon(Icons.arrow_circle_left_outlined)),
                  const ResponsiveSizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: CustomTextFormField(
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
                      onTap:(){
                        _key.currentState!.openDrawer();
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
              const SearchGridView(),
            ],
          ),
        ),
      ),
    );
  }
}


