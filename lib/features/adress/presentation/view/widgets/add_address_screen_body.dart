import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/features/adress/presentation/manger/address_cubit.dart';
import 'package:swifit_cart/features/adress/presentation/view/widgets/profile_apprach_fields.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class AddAddressScreenBody extends StatelessWidget {
  const AddAddressScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Address',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          final cubit = AddressCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  if(state is AddressLoadingState)
                    const Padding(
                      padding:  EdgeInsets.only(top: 20.0),
                      child:  LinearProgressIndicator(),
                    ),
                  const SizedBox(
                    height: 38,
                  ),
                  Container(
                    height: 64.h,
                    width: 388.w,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 18.w,
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(Icons.location_on_outlined),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'your location',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                    color:
                                        const Color(0xffFFFFFF).withOpacity(.4)),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                'Please add address',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ],
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ProfileApproachFields(
                      validate: (value){
                        if(value!.isEmpty){
                          return 'this field must not empty';
                        }
                      },
                      controller: cubit.countryController,
                      text: 'Country',
                      hintText: 'Add Your Country'),
                  ProfileApproachFields(
                      validate: (value){
                        if(value!.isEmpty){
                          return 'this field must not empty';
                        }
                      },
                      controller: cubit.cityController,
                      text: 'City',
                      hintText: 'Add Your city'),
                  ProfileApproachFields(
                    validate: (value){
                      if(value!.isEmpty){
                        return 'this field must not empty';
                      }
                    },
                      controller: cubit.regionController,
                      text: 'Region',
                      hintText: 'Add Your Region'),
                  ProfileApproachFields(
                      validate: (value){
                        if(value!.isEmpty){
                          return 'this field must not empty';
                        }
                      },
                      controller: cubit.streetController,
                      text: 'Street',
                      hintText: 'Add Your Street'),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    onPressed: () {
                      if(cubit.formKey.currentState!.validate()){
                        cubit.addAddress(context);

                      }
                    },
                    buttonName: 'Add',
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
