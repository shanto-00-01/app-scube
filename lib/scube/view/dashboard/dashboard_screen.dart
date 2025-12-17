import 'package:app_scube/core/common/appbar_c.dart';
import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/gen/assets.gen.dart';
import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:app_scube/core/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/action_activities.dart';
import 'widgets/empty_data.dart';
import 'widgets/source_data_dart';
import 'widgets/top_tabbar.dart';
import 'widgets/total_power.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool havingData = true;
  int _selectedTabIndex = 0;
  bool isSource = true;

  // Scroll controller for the data list
  final ScrollController _listScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "SCM",
        actionsWidgets: [
          Container(
            height: 20.h,
            width: 20.w,
            margin: EdgeInsets.only(right: 24.w),
            padding: EdgeInsets.only(top: 14.h, right: 2.w),
            alignment: Alignment.topRight,

            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(Assets.icons.bell.path)),
            ),
            child: Icon(Icons.circle, color: Colors.red, size: 9.sp),
          ),
        ],
      ),
      body: havingData
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildWhiteCard(
                    allocate: Column(
                      children: [
                        Row(
                          children: [
                            buildInteractiveTab(
                              "Summery",
                              0,
                              _selectedTabIndex,
                              (index) {
                                setState(() {
                                  _selectedTabIndex = index;
                                });
                              },
                            ),
                            buildInteractiveTab("SLD", 1, _selectedTabIndex, (
                              index,
                            ) {
                              setState(() {
                                _selectedTabIndex = index;
                              });
                            }),
                            buildInteractiveTab("Data", 2, _selectedTabIndex, (
                              index,
                            ) {
                              setState(() {
                                _selectedTabIndex = index;
                              });
                            }),
                          ],
                        ),

                        //start shanto
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 8.w,
                            vertical: 12.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Electricity",
                                style: TextFontStyle.text16c04063EInter500
                                    .copyWith(color: AppColors.c979797),
                              ),
                              Divider(thickness: 1, color: AppColors.c979797),
                              PowerWidget(),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),

                                decoration: BoxDecoration(
                                  color: AppColors.cE2EBF1,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildSourceDataToggle(
                                      'Source',
                                      isSource,
                                      () {
                                        setState(() {
                                          isSource = true;
                                        });
                                      },
                                    ),
                                    buildSourceDataToggle(
                                      "Load",
                                      !isSource,
                                      () {
                                        setState(() {
                                          isSource = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(thickness: 1, color: AppColors.c979797),
                            ],
                          ),
                        ),
                        //End shanto
                      ],
                    ),
                    horizontalPadding: 0,
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                ActionActivities(),
              ],
            )
          : _buildWhiteCard(allocate: emptyData),
    );
  }
}

Widget _buildDataCard({
  required IconData icon,
  required String title,
  required String status,
  required String data1,
  required String data2,
  required Color statusColor,
  required Color iconColor,
  bool isInactive = false,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: isInactive ? Colors.blue.withOpacity(0.05) : Colors.blue.shade50,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.blue.shade100),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, size: 32, color: iconColor),
        ),
        const SizedBox(width: 10),
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
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    status,
                    style: TextStyle(
                      color: isInactive ? Colors.red : Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    "Data 1  : ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(data1, style: const TextStyle(fontSize: 13)),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Data 2  : ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(data2, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    ),
  );
}

Widget _buildWhiteCard({
  required Widget allocate,
  double? horizontalPadding = 26,
}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding!.w),
    margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),

    decoration: BoxDecoration(
      color: AppColors.cWhite,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: allocate,
  );
}
