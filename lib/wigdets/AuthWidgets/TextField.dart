import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_text_decoration.dart';

class CustomTextField extends StatelessWidget {
  final String Function(String) validateField;
  final void Function(String) onChange;
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  CustomTextField(
      {@required this.validateField,
      @required this.controller,
      this.hintText,
      this.isObsecure = false,
      @required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: 4.h, bottom: 4.h, right: 4.w, left: 15.w),
        child: TextFormField(
          onChanged: (value) => onChange(value),
          style: AppTextDecoration.bodyText2.copyWith(fontSize: 16.sp),
          validator: (value) {
            return validateField(value);
          },
          controller: controller,
          obscureText: isObsecure,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 18.sp,
            ),
            border: InputBorder.none,
            fillColor: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
