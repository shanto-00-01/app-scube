import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_font_style.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helper/ui_helper.dart';

Widget get emptyData => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset(
      Assets.images.dataEmpty.path,
      height: 193.h,
      width: double.infinity,
    ),
    UIHelper.verticalSpace(12.h),
    Text(
      "No data is here, please wait ",
      textAlign: TextAlign.center,
      style: TextFontStyle.text12c5E5E5EInter400.copyWith(fontSize: 14.sp),
    ),
  ],
);
