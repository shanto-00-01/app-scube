
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class UIHelper {
  UIHelper._internal();


  //Vertical spacing
  static Widget get verticalSpaceSmall => SizedBox(height: 10.0.w);
  static Widget get verticalSpaceMedium => SizedBox(height: 20.0.w);
  static Widget get verticalSpaceSemiLarge => SizedBox(height: 40.0.w);
  static Widget get verticalSpaceLarge => SizedBox(height: 60.0.w);

  //Horizontal spacing
  static Widget get horizontalSpaceSmall => SizedBox(width: 10.0.w);
  static Widget get horizontalSpaceMedium => SizedBox(width: 20.0.w);
  static Widget get horizontalSpaceSemiLarge => SizedBox(width: 40.0.w);
  static Widget get horizontalSpaceLarge => SizedBox(width: 60.0.w);

  //Initialize spacing with value
  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);
}
