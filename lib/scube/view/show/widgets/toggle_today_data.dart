import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_font_style.dart';
import '../../../../core/gen/colors.gen.dart';
import '../../../../core/helper/ui_helper.dart';

Widget buildToggleOption(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.radio_button_checked,
              color: isSelected ? AppColors.c0096FC : AppColors.cA5A7B9,
              size: 20.sp,
            ),
            UIHelper.horizontalSpace(6.w),
            Text(
              label,
              style: TextFontStyle.text16c04063EInter500.copyWith(
                color: isSelected ? AppColors.c0096FC : AppColors.cA5A7B9,
              ),
            ),
          ],
        ),
      ),
    );
  }