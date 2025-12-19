import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:app_scube/core/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/appbar_c.dart';
import 'widgets/custom_gauge.dart';
import 'widgets/data_card.dart';
import 'widgets/data_filter.dart';
import 'widgets/revenue.dart';
import 'widgets/toggle_today_data.dart';

class SCMDetailScreen extends StatefulWidget {
  const SCMDetailScreen({super.key});

  @override
  State<SCMDetailScreen> createState() => _SCMDetailScreenState();
}

class _SCMDetailScreenState extends State<SCMDetailScreen> {
  bool isDataView = true;
  bool isTodayData = true;
  DateTime? _fromDate;
  DateTime? _toDate;
  String _dateError = '';

  String _formatDate(DateTime? date) {
    if (date == null) return "";
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.c0096FC,
              onPrimary: AppColors.cWhite,
              onSurface: AppColors.cBlack,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
          _dateError = '';
        } else {
          _toDate = picked;
          _dateError = '';
        }
      });
    }
  }

  bool _isValidDateRange() {
    if (_fromDate != null && _toDate != null) {
      if (_fromDate!.isAfter(_toDate!)) {
        setState(() {
          _dateError = 'From Date cannot be later than To Date!';
        });
        return false;
      }
    }
    return true;
  }

  void _onSearch() {
    if (_isValidDateRange()) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "SCM"),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(top: 45.h),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 45.h),
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              border: Border.all(color: AppColors.cB0B2C2),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceSmall,
                  Center(
                    child: CustomGauge(
                      currentValue: isDataView ? 57 : 88974,
                      maxValue: isDataView ? 100 : 100000,
                      lebel: isDataView ? "kWh/Sqft" : "TK",
                    ),
                  ),
                  if (isDataView) ...[
                    UIHelper.verticalSpaceSemiLarge,
                    _buildDateFilters(),
                    UIHelper.verticalSpaceMedium,
                    if (!isTodayData) ...[
                      _buildDateInputRow(context),
                      UIHelper.verticalSpaceMedium,
                      _buildErrorText(),
                    ],

                    dataContainer(isTodayData ? 1 : 3),
                  ] else ...[
                    UIHelper.verticalSpaceMedium,
                    ExpandableDataCard(),
                  ],
                ],
              ),
            ),
          ),
          _buildTopToggleSwitch(),
        ],
      ),
    );
  }

  Widget _buildErrorText() {
    if (_dateError.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          _dateError,
          style: TextStyle(
            color: Colors.red,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildDateInputRow(BuildContext context) {
    return Row(
      children: [
        _buildDateInputField("From Date", _fromDate, context, true),
        UIHelper.horizontalSpace(8.w),
        _buildDateInputField("To Date", _toDate, context, false),
        UIHelper.horizontalSpace(8.w),
        _buildSearchButton(),
      ],
    );
  }

  Widget _buildDateInputField(
    String label,
    DateTime? date,
    BuildContext context,
    bool isFromDate,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _selectDate(context, isFromDate),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.cB0B2C2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date == null ? label : _formatDate(date),
                style: TextFontStyle.text12c04063EInter400,
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 18.sp,
                color: AppColors.c5E5E5E,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return InkWell(
      onTap: _onSearch,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
          color: AppColors.cE2EBF1,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.c0096FC),
        ),
        child: Icon(Icons.search, color: AppColors.c0096FC),
      ),
    );
  }

  Widget _buildTopToggleSwitch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(vertical: 14.w),
      decoration: BoxDecoration(
        color: AppColors.cWhite,
        border: Border.all(color: AppColors.cB0B2C2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          buildToggleOption(
            "Data View",
            isDataView,
            () => setState(() => isDataView = true),
          ),
          buildToggleOption(
            "Revenue View",
            !isDataView,
            () => setState(() => isDataView = false),
          ),
        ],
      ),
    );
  }

  Widget _buildDateFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildDateFilterOption(
          "Today Data",
          isTodayData,
          () => setState(() => isTodayData = true),
        ),
        UIHelper.horizontalSpace(6.w),
        buildDateFilterOption(
          "Custom Date Data",
          !isTodayData,
          () => setState(() => isTodayData = false),
        ),
      ],
    );
  }
}
