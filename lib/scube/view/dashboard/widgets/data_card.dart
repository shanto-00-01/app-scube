import 'package:app_scube/core/helper/all_routes.dart';
import 'package:app_scube/core/helper/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_font_style.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/gen/colors.gen.dart';
import '../../../../core/helper/ui_helper.dart';

class DataCardProperty {
  String iconImg;
  String title;
  String status;
  String data1;
  String data2;
  Color statusColor;
  bool isInactive;
  //VoidCallback ontap;
  DataCardProperty({
    required this.iconImg,
    required this.title,
    required this.status,
    required this.data1,
    required this.data2,
    required this.statusColor,
    this.isInactive = false,
  });
}

List<DataCardProperty> sourceAllData = [
  DataCardProperty(
    iconImg: Assets.icons.solar.path,
    title: "Data View",
    status: "(Active)",
    data1: "55505.63",
    data2: "58805.63",
    statusColor: Colors.blue,
  ),

  DataCardProperty(
    iconImg: Assets.icons.battery.path,
    title: "Data Type 2",
    status: "(Active)",
    data1: "55505.63",
    data2: "58805.63",
    statusColor: Colors.orange,
  ),

  DataCardProperty(
    iconImg: Assets.icons.power.path,
    title: "Data Type 3",
    status: "(Inactive)",
    data1: "55505.63",
    data2: "58805.63",
    statusColor: Colors.red,

    isInactive: true,
  ),

  DataCardProperty(
    iconImg: Assets.icons.solar.path,
    title: "Data Type 4",
    status: "(Inactive)",
    data1: "12345.63",
    data2: "99887.63",
    statusColor: Colors.purple,

    isInactive: true,
  ),
];

Widget buildDataCard({
  required DataCardProperty property
}) {
  return GestureDetector(
    onTap: () {
      NavigationService.navigateTo(Routes.sCMDetailScreen);
    }, // ontap,
    child: Container(
      padding: EdgeInsets.all(12.sp),
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        color: AppColors.cE5F4FE,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Image.asset(property.iconImg, height: 24.h, width: 24.w),
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
                        color: property.statusColor,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    UIHelper.horizontalSpace(6.w),
                    Text(property.title, style: TextFontStyle.text14c04063EInter500),
                    UIHelper.horizontalSpace(6.w),
                    Text(
                      property.status,
                      style: TextFontStyle.text12c5E5E5EInter400.copyWith(
                        color: property.isInactive ? Colors.red : AppColors.c0096FC,
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
                    Text(property.data1, style: TextFontStyle.text12c5E5E5EInter400),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Data 2  : ",
                      style: TextFontStyle.text12c5E5E5EInter400,
                    ),
                    Text(property.data2, style: TextFontStyle.text12c5E5E5EInter400),
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
