import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class CustomPasswordFormField extends StatefulWidget {
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;

  // ignore: use_super_parameters
  const CustomPasswordFormField({
    Key? key,
    this.labelText,
    this.controller,
    this.inputType,
    this.validator,

    //this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      readOnly: false,
      cursorHeight: 20.h,
      cursorColor: AppColors.c0096FC,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      maxLines: 1,
      controller: widget.controller,
      obscureText: isPasswordVisible,

      decoration: InputDecoration(
        labelStyle: TextFontStyle.text16c5E5E5EInter400.copyWith(
          fontSize: 14.sp,
        ),
        suffixIcon: GestureDetector(
          onTap: togglePasswordVisibility,
          child: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.cB9C6D6,
            // color: AppColors.cC7959D,
          ),
        ),
        fillColor: AppColors.cWhite,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),

        labelText: widget.labelText,
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

      keyboardType: widget.inputType,
    );
  }
}
