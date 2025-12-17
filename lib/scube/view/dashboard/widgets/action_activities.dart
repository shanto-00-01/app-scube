import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/gen/assets.gen.dart';
import 'package:app_scube/core/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/gen/colors.gen.dart';

class DataModel {
  String imgIcon;
  String label;
  void Function() onCall;

  DataModel({required this.imgIcon, required this.label, required this.onCall});
}

class ActionActivities extends StatelessWidget {
  const ActionActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        children: [
          ActivityMenu(
            actionActivity: DataModel(
              imgIcon: Assets.icons.chart.path,
              label: "Analysis Pro",
              onCall: () {},
            ),
          ),
          ActivityMenu(
            actionActivity: DataModel(
              imgIcon: Assets.icons.generator.path,
              label: "G. Generator",
              onCall: () {},
            ),
          ),
          ActivityMenu(
            actionActivity: DataModel(
              imgIcon: Assets.icons.charge.path,
              label: "Plant Summery",
              onCall: () {},
            ),
          ),
          ActivityMenu(
            actionActivity: DataModel(
              imgIcon: Assets.icons.fire.path,
              label: "Natural Gas",
              onCall: () {},
            ),
          ),
          ActivityMenu(
            actionActivity: DataModel(
              imgIcon: Assets.icons.generator.path,
              label: "D. Generator",
              onCall: () {},
            ),
          ),
          ActivityMenu(
            actionActivity: DataModel(
              imgIcon: Assets.icons.faucet.path,
              label: "Water Process",
              onCall: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityMenu extends StatelessWidget {
  final DataModel actionActivity;

  const ActivityMenu({super.key, required this.actionActivity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionActivity.onCall,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.cWhite,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.cBFC0D5),
        ),
        child: Row(
          children: [
            Image.asset(actionActivity.imgIcon, height: 24.h, width: 24.w),
            UIHelper.horizontalSpace(8.w),
            Expanded(
              child: Text(
                actionActivity.label,
                style: TextFontStyle.text14c0096FCInter500.copyWith(
                  color: AppColors.c646984,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
