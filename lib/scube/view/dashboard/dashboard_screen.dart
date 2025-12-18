import 'package:app_scube/core/common/appbar_c.dart';
import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/gen/assets.gen.dart';
import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:app_scube/core/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/action_activities.dart';
import 'widgets/data_card.dart';
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

  final ScrollController _listScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "SCM",
        
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
                        if (_selectedTabIndex == 0)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 8.w,
                                vertical: 12.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Electricity",
                                    style: TextFontStyle.text16c04063EInter500
                                        .copyWith(color: AppColors.c979797),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: AppColors.c979797,
                                  ),
                                  PowerWidget(),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),

                                    decoration: BoxDecoration(
                                      color: AppColors.cE2EBF1,
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  Divider(
                                    thickness: 1,
                                    color: AppColors.c979797,
                                  ),
                                  if (isSource)
                                    Expanded(
                                      child: SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: RawScrollbar(
                                          controller: _listScrollController,
                                          thumbVisibility: true,
                                          thumbColor: AppColors.c0096FC,
                                          trackVisibility: true,
                                          radius: Radius.circular(20.r),
                                          thickness: 2,

                                          padding: EdgeInsets.only(right: 4.w),
                                          child: ListView(
                                            physics: BouncingScrollPhysics(),
                                            controller: _listScrollController,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                            ),
                                            children: [
                                              buildDataCard(
                                                iconImg:
                                                    Assets.icons.solar.path,
                                                title: "Data View",
                                                status: "(Active)",
                                                data1: "55505.63",
                                                data2: "58805.63",
                                                statusColor: Colors.blue,
                                                iconColor: Colors.black87,
                                              ),
                                              const SizedBox(height: 8),
                                              buildDataCard(
                                                iconImg:
                                                    Assets.icons.battery.path,
                                                title: "Data Type 2",
                                                status: "(Active)",
                                                data1: "55505.63",
                                                data2: "58805.63",
                                                statusColor: Colors.orange,
                                                iconColor: Colors.black87,
                                              ),
                                              const SizedBox(height: 8),
                                              buildDataCard(
                                                iconImg:
                                                    Assets.icons.power.path,
                                                title: "Data Type 3",
                                                status: "(Inactive)",
                                                data1: "55505.63",
                                                data2: "58805.63",
                                                statusColor: Colors.red,
                                                iconColor: Colors.teal,
                                                isInactive: true,
                                              ),
                                              const SizedBox(height: 8),
                                              buildDataCard(
                                                iconImg:
                                                    Assets.icons.solar.path,
                                                title: "Data Type 4",
                                                status: "(Inactive)",
                                                data1: "12345.63",
                                                data2: "99887.63",
                                                statusColor: Colors.purple,
                                                iconColor: Colors.indigo,
                                                isInactive: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        //End shanto
                      ],
                    ),
                    horizontalPadding: 0,
                  ),
                ),
                UIHelper.verticalSpaceSmall,
                ActionActivities(),
              ],
            )
          : _buildWhiteCard(allocate: emptyData),
    );
  }
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
