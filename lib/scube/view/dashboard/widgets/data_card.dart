
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_font_style.dart';
import '../../../../core/gen/colors.gen.dart';
import '../../../../core/helper/ui_helper.dart';

Widget buildDataCard({
  required String iconImg,
  required String title,
  required String status,
  required String data1,
  required String data2,
  required Color statusColor,
  required Color iconColor,
  bool isInactive = false,
  // required VoidCallback ontap,
}) {
  return GestureDetector(
    onTap: () {}, // ontap,
    child: Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: AppColors.cE5F4FE,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Image.asset(iconImg, height: 24.h, width: 24.w),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    UIHelper.horizontalSpace(6.w),
                    Text(title, style: TextFontStyle.text14c04063EInter500),
                    UIHelper.horizontalSpace(6.w),
                    Text(
                      status,
                      style: TextFontStyle.text12c5E5E5EInter400.copyWith(
                        color: isInactive ? Colors.red : AppColors.c0096FC,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(4.w),
                Row(
                  children: [
                    Text(
                      "Data 1  : ",
                      style: TextFontStyle.text12c5E5E5EInter400,
                    ),
                    Text(data1, style: TextFontStyle.text12c5E5E5EInter400),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Data 2  : ",
                      style: TextFontStyle.text12c5E5E5EInter400,
                    ),
                    Text(data2, style: TextFontStyle.text12c5E5E5EInter400),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.c04063E),
        ],
      ),
    ),
  );
}
