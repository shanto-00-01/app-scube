import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_font_style.dart';
import '../../../../core/gen/colors.gen.dart';
import '../../../../core/helper/ui_helper.dart';

class CardCount {
  List<ListItem> items;
  DateTime? date;
  CardCount({this.items = const [], this.date});
}

List<CardCount> totalCard = [
  CardCount(items: items),
  CardCount(items: items),
  CardCount(items: items),
];

class ListItem {
  final String title;
  final Color color;
  final String percentage;
  final String amount;

  ListItem({
    required this.title,
    required this.color,
    required this.percentage,
    required this.amount,
  });
}

List<ListItem> items = [
  ListItem(
    title: "Data A",
    color: AppColors.c0096FC,
    percentage: "2798.50 (29.53%)",
    amount: "35689",
  ),
  ListItem(
    title: "Data B",
    color: AppColors.c0096FC,
    percentage: "72598.50 (35.39%)",
    amount: "5259689",
  ),
  ListItem(
    title: "Data C",
    color: Colors.purpleAccent,
    percentage: "6598.36 (83.90%)",
    amount: "5698756",
  ),
  ListItem(
    title: "Data D",
    color: Colors.orange,
    percentage: "6598.26 (36.59%)",
    amount: "356987",
  ),
];

Widget dataContainer(int item) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),

    itemCount: item,
    itemBuilder: (_, index) {
      return _buildDetailCard();
    },
  );
}

Widget _buildDetailCard() {
  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.cB0B2C2),
    ),
    padding: EdgeInsets.all(12.sp),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Energy Chart",
                textAlign: TextAlign.center,
                style: TextFontStyle.text14c04063EInter500,
              ),
            ),
            Expanded(
              child: Text(
                "5.53 kw",
                textAlign: TextAlign.center,
                style: TextFontStyle.headline32c04063EInter500,
              ),
            ),
          ],
        ),
        UIHelper.verticalSpaceSmall,

        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),

          itemBuilder: (_, index) {
            return _buildListItem(items[index]);
          },
        ),
      ],
    ),
  );
}

Widget _buildListItem(ListItem item) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
    margin: EdgeInsets.only(bottom: 6.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.cB0B2C2),
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.circle, color: item.color, size: 10.sp),
            UIHelper.verticalSpace(4.h),
            Text(item.title, style: TextFontStyle.text14c04063EInter500),
          ],
        ),

        Container(
          height: 30.h,
          width: 1.w,
          color: AppColors.cB0B2C2,
          margin: EdgeInsets.symmetric(horizontal: 6.w),
        ),

        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Data  : ", style: TextFontStyle.text12c04063EInter400),
                  Text(
                    item.percentage,
                    style: TextFontStyle.text14c04063EInter500,
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text("Cost  : ", style: TextFontStyle.text12c04063EInter400),
                  Text(
                    "${item.amount} ৳",
                    style: TextFontStyle.text14c04063EInter500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
