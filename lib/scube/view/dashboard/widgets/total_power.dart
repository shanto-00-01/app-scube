import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/gen/colors.gen.dart';

// ignore: must_be_immutable
class PowerWidget extends StatelessWidget {
  String headline;
  String speed;
  double percentage;
  PowerWidget({
    super.key,
    this.headline = "Total Power",
    this.speed = "5.53Kw",
    this.percentage = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: 110.w,
      child: Stack(
        children: [
          SizedBox(
            height: 130.h,
            width: 110.w,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 8.r,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              color: AppColors.c0096FC,
              backgroundColor: AppColors.cE5F4FE,
              strokeCap: StrokeCap.round,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    headline,
                    style: TextFontStyle.text12c04063EInter400,
                  ),
                  Text(speed, style: TextFontStyle.text16c04063EInter500),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
