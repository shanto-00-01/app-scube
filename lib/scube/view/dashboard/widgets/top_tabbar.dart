import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:app_scube/core/constant/text_font_style.dart';

Widget buildInteractiveTab(String text, int index, int selectedTabIndex, Function(int) onTabChange) {
  bool isActive = selectedTabIndex == index;

  return Expanded(
    child: GestureDetector(
      onTap: () => onTabChange(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        margin: EdgeInsets.all(0.sp),
        decoration: BoxDecoration(
          color: isActive ? AppColors.c0096FC : Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7.r),
            topRight: Radius.circular(7.r),
          ),
          border: Border(bottom: BorderSide(color: AppColors.cB6B8D0)),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextFontStyle.text14cFFFFFFInter700.copyWith(
            color: isActive ? AppColors.cWhite : AppColors.c646984,
          ),
        ),
      ),
    ),
  );
}
