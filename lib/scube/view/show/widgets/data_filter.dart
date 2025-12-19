 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_font_style.dart';
import '../../../../core/gen/colors.gen.dart';
import '../../../../core/helper/ui_helper.dart';

Widget buildDateFilterOption(
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 12.sp,
            color: isSelected ? AppColors.c0096FC : AppColors.cA5A7B9,
          ),
          UIHelper.horizontalSpace(6.w),
          Text(
            label,
            style: TextFontStyle.text16c04063EInter500.copyWith(
              fontSize: 12.sp,
              color: isSelected ? AppColors.c0096FC : AppColors.cA5A7B9,
            ),
          ),
        ],
      ),
    );
  }