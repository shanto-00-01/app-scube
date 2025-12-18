import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/colors.gen.dart';

class ExpandableDataCard extends StatefulWidget {
  const ExpandableDataCard({super.key});

  @override
  State<ExpandableDataCard> createState() => _ExpandableDataCardState();
}

class _ExpandableDataCardState extends State<ExpandableDataCard> {
  bool _isExpanded = false; // Controls the expanded/collapsed state

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cWhite,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.cB0B2C2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(10.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  Icon(
                    Icons.bar_chart_rounded,
                    color: AppColors.c646984,
                    size: 24.sp,
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Text(
                    "Data & Cost Info",
                    style: TextFontStyle.text12c5E5E5EInter500,
                  ),
                  const Spacer(),

                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: AppColors.c0096FC,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isExpanded
                          ? Icons.keyboard_double_arrow_up
                          : Icons.keyboard_double_arrow_down,
                      color: AppColors.cWhite,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  const Divider(color: AppColors.c646984, thickness: 0.5),
                  UIHelper.verticalSpace(12.h),
                  _buildInfoRow("1", "2798.50 (29.53%)", "35689"),
                  UIHelper.verticalSpace(12.h),
                  _buildInfoRow("2", "2798.50 (29.53%)", "35689"),
                  UIHelper.verticalSpace(12.h),
                  _buildInfoRow("3", "2798.50 (29.53%)", "35689"),
                  UIHelper.verticalSpace(12.h),
                  _buildInfoRow("4", "2798.50 (29.53%)", "35689"),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String index, String dataValue, String costValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Data $index  : ", style: TextFontStyle.text12c5E5E5EInter400),
            Text(dataValue, style: TextFontStyle.text14c04063EInter500),
          ],
        ),
        UIHelper.verticalSpace(8.h),
        Row(
          children: [
            Text("Cost $index  : ", style: TextFontStyle.text12c5E5E5EInter400),
            Text(
              "$costValue ৳", 
              style: TextFontStyle.text14c04063EInter500,
            ),
          ],
        ),
      ],
    );
  }
}
