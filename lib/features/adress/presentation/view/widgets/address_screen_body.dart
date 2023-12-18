import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/functions/navigator_push.dart';
import 'package:swifit_cart/core/widgets/error_page.dart';
import 'package:swifit_cart/core/widgets/shimmer.dart';
import 'package:swifit_cart/features/adress/presentation/manger/address_cubit.dart';
import '../../../../../core/utils/styles.dart';
import '../add_address_screen.dart';
import 'addres_list_view_item.dart';

class AddressScreenBody extends StatelessWidget {
  const AddressScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Address',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                navigatorPush(const AddAddressScreen(), context);
              },
              icon: const Icon(
                Icons.add_circle_outline_outlined,
              ))
        ],
      ),
      body: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          var cubit = AddressCubit.get(context);
          if (state is GetAddressSuccessState) {
            return ListView.separated(
                itemBuilder: (context, index) => AddressListViewItem(
                    addressDatum: cubit.addressModel!.data!.data![index]),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: cubit.addressModel!.data!.total!);
          }
          else if (state is GetAddressErrorState) {
            return ErrorPage(
              text: state.errorMessage,
            );
          }   else {
            return ListView.separated(
                itemBuilder: (context, index) => shimmerAddressCard(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: 5);
          }
        },
      ),
    );
  }
}
