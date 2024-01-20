import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swifit_cart/constant.dart';
import 'package:swifit_cart/core/widgets/custom_button.dart';
import 'package:swifit_cart/core/widgets/custom_text_form_field.dart';
import 'package:swifit_cart/core/widgets/responsive_sized_box.dart';
import 'package:swifit_cart/core/widgets/text_filed_name.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/account/account_cubit.dart';
import 'account_view_loading.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    AccountCubit.get(context).fetchAccountData();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        var cubit = AccountCubit.get(context);
        nameController.text = cubit.accountData?.data?.name??'';
        phoneController.text = cubit.accountData?.data?.phone??'';
        emailController.text = cubit.accountData?.data?.email??'';

        if (state is AccountLoadingState) {
          return ListView.builder(itemBuilder: (context, index) => const AccountViewLoading(),
            itemCount:2,);
        }
        if (state is GetAccountSuccessState) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                children: [
                  const ResponsiveSizedBox(
                    height: 40,
                  ),
                  if(state is UpdateAccountLoadingState)
                    const LinearProgressIndicator(color: kPrimaryColor,),
                  const TextFieldName(name: "Full Name"),
                  CustomTextFormField(
                    controller: nameController,
                  ),
                  const ResponsiveSizedBox(
                    height: 18,
                  ),
                  const TextFieldName(name: "Email Address"),
                  CustomTextFormField(
                    controller: emailController,
                  ),
                  const ResponsiveSizedBox(
                    height: 18,
                  ),
                  const TextFieldName(name: "Phone"),
                  CustomTextFormField(
                    controller: phoneController,
                  ),
                  const ResponsiveSizedBox(
                    height: 160,
                  ),
                  CustomButton(
                    onPressed: () {
                      cubit.updateAccountData(nameController.text,
                          emailController.text, phoneController.text);
                    },
                    buttonName: "Save changes",
                  ),
                ],
              ),
            ),
          );
        }
        else {
          return  Center(
            child: Text(
              "an error happen Please try again",
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
          );

        }
      },
    );
  }
}
