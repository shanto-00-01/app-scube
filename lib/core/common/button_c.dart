import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../helper/ui_helper.dart';

Widget customButton({
  required String name,
  required VoidCallback onCallBack,
  required double height,
  required double minWidth,
  required double borderRadius,
  required Color color,
  required TextStyle textStyle,
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
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    color: color,

    child: isPrefix == false
        ? Text(name, style: textStyle)
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isPrefixIcon == true
                  ? (setPrefixIcon ?? SizedBox())
                  : Image.asset(prefixImgPath!, height: 24.h, width: 24.w),

              UIHelper.horizontalSpace(16.w),
              Text(name, style: textStyle),
            ],
          ),
  );
}
