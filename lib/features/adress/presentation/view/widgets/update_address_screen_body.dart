import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/core/utils/styles.dart';
import 'package:swifit_cart/features/adress/presentation/manger/address_cubit.dart';
import 'package:swifit_cart/features/adress/presentation/view/widgets/profile_apprach_fields.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/model/address_model.dart';

class UpdateAddressScreenBody extends StatelessWidget {
  const UpdateAddressScreenBody({Key? key,required this.addressDatum }) : super(key: key);
  final AddressDatum addressDatum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Address',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          var cubit=AddressCubit.get(context);
          cubit.streetController.text=addressDatum.details!;
          cubit.cityController.text=addressDatum.city!;
          cubit.countryController.text=addressDatum.name!;
          cubit.regionController.text=addressDatum.region!;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 38.h, horizontal: 20.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(state is AddressLoadingState)
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            vertical: 10.h),
                        child: const LinearProgressIndicator(),
                      ),
                    ProfileApproachFields(
                      controller: cubit.countryController,
                        text: 'Country', hintText: 'enter your country'),
                    ProfileApproachFields(
                      controller: cubit.cityController,
                        text: 'City',hintText: 'enter your city',),
                    ProfileApproachFields(
                        controller: cubit.regionController,
                        text: 'Region', hintText: 'Add Your Region'),
                    ProfileApproachFields(
                        controller: cubit.streetController,
                        text: 'Street', hintText: 'Add Your Street'),
                    const SizedBox(
                      height: 50,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         CustomButton(
                          onPressed: (){

                            cubit.updateAddress(
                                context: context,
                                id: addressDatum.id.toString());
                          },
                          width: 150,
                          buttonName: 'Update ',
                        ),
                        CustomButton(
                          onPressed: (){
                            cubit.deleteAddress(context,id: addressDatum.id.toString());
                          },
                          width: 150,
                          buttonName: 'delete ',
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
