import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/responsive_sized_box.dart';
import '../../../../../core/widgets/text_filed_name.dart';

class AccountViewLoading extends StatelessWidget {

  const AccountViewLoading({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ResponsiveSizedBox(height: 20),
        _buildTextField("Full Name" ),
        _buildTextField("Email Address" ),
        _buildTextField("Phone" ),
        _buildTextField("Phone" ),
        _buildTextField("Phone" ),
        const ResponsiveSizedBox(height: 160),
      ],
    );
  }

  Widget _buildTextField(String label, ) {
    return  Column(
      children: [
        ResponsiveSizedBox(height: 18.h),
          const CustomTextFormField(
          ),
      ],
    );
  }

}
