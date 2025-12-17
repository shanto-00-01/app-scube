import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:app_scube/core/constant/text_font_style.dart';



  Widget buildSourceDataToggle(String text, bool isActive, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? AppColors.c0096FC : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
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

