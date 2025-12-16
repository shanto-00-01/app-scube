import 'dart:developer';

import 'package:app_scube/core/common/button_c.dart';
import 'package:app_scube/core/common/password_form_c.dart';
import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/gen/assets.gen.dart';
import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:app_scube/core/helper/ui_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/text_form_c.dart';
import '../../../core/helper/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.c0096FC,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UIHelper.verticalSpace(80.h),
          Center(
            child: Image.asset(
              Assets.icons.logo.path,
              height: 98.h,
              width: 96.w,
              fit: BoxFit.fill,
            ),
          ),
          UIHelper.verticalSpaceMedium,
          Text("SCUBE", style: TextFontStyle.headline24cFFFFFFInter600),
          Text(
            "Control & Monitoring System",
            style: TextFontStyle.headline24cFFFFFFInter600.copyWith(
              fontSize: 20.sp,
            ),
          ),
          UIHelper.verticalSpace(80.h),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 32.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextFontStyle.headline32c000000Inter700,
                    ),
                    UIHelper.verticalSpace(26.h),
                    CustomFormField(
                      controller: nameController,
                      inputType: TextInputType.name,
                      validator: validateUserName,
                      labelText: "Username",
                    ),
                    UIHelper.verticalSpace(16.h),
                    CustomPasswordFormField(
                      controller: passController,
                      inputType: TextInputType.visiblePassword,
                      validator: validatePassword,
                      labelText: "Password",
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          log(nameController.text);
                        },
                        child: Text(
                          "Forget password?",
                          style: TextFontStyle.text12c5E5E5EInter400.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(20.h),
                    customButton(
                      name: "Login",
                      onCallBack: () {},
                      minWidth: double.infinity,
                      context: context,
                    ),
                    UIHelper.verticalSpace(8.h),
                    RichText(
                      text: TextSpan(
                        style: TextFontStyle.text12c5E5E5EInter400,
                        children: [
                          TextSpan(text: "Don't have any account? "),
                          TextSpan(
                            text: "register now",
                            style:TextFontStyle.text14c0096FCInter500,
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){

                              }, 
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
