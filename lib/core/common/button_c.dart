import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/text_font_style.dart';
import '../helper/ui_helper.dart';

Widget customButton({
  required String name,
  required VoidCallback onCallBack,
  double? height = 60,
  double? minWidth = 120,
  double? borderRadius = 10,
  Color? color = AppColors.c0096FC,
  TextStyle? textStyle,
  required BuildContext context,
  Color? borderColor,
  String? prefixImgPath,
  Widget? setPrefixIcon,
  bool? isPrefixIcon = false,
  bool? isPrefix = false,
}) {
  return MaterialButton(
    onPressed: onCallBack,
    height: height,
    minWidth: minWidth,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius!),
    ),
    color: color!,

    child: isPrefix == false
        ? Text(name, style: textStyle ?? TextFontStyle.headline18cFFFFFFInter500)
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isPrefixIcon == true
                  ? (setPrefixIcon ?? SizedBox())
                  : Image.asset(prefixImgPath!, height: height!.h, width: minWidth!.w),

              UIHelper.horizontalSpace(16.w),
              Text(name, style: textStyle ?? TextFontStyle.headline18cFFFFFFInter500),
            ],
          ),
  );
}
