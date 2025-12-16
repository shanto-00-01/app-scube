import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class CustomFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;

  // ignore: use_super_parameters
  const CustomFormField({
    Key? key,
    this.labelText,
    this.controller,
    this.inputType,
    this.validator,

    //this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      readOnly: false,
      cursorHeight: 20.h,
      cursorColor: AppColors.c0096FC,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLines: 1,
      controller: controller,

      decoration: InputDecoration(
        labelStyle: TextFontStyle.text16c5E5E5EInter400.copyWith(
          fontSize: 14.sp,
        ),
        fillColor: AppColors.cWhite,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),

        labelText: labelText,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.15.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.c0096FC, width: 1.15.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide(color: AppColors.cB9C6D6, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0.r),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide(color: AppColors.cB9C6D6, width: 1.w),
        ),
      ),
      style: TextFontStyle.text16c5E5E5EInter400,

      keyboardType: inputType,
    );
  }
}
