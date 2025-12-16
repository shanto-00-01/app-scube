
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class UIHelper {
  UIHelper._internal();


  //Vertical spacing
  static Widget verticalSpaceSmall = SizedBox(height: 10.0.w);
  static Widget verticalSpaceMedium = SizedBox(height: 20.0.w);
  static Widget verticalSpaceSemiLarge = SizedBox(height: 40.0.w);
  static Widget verticalSpaceLarge = SizedBox(height: 60.0.w);

  //Horizontal spacing
  static Widget horizontalSpaceSmall = SizedBox(width: 10.0.w);
  static Widget horizontalSpaceMedium = SizedBox(width: 20.0.w);
  static Widget horizontalSpaceSemiLarge = SizedBox(width: 40.0.w);
  static Widget horizontalSpaceLarge = SizedBox(width: 60.0.w);

  //Initialize spacing with value
  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);
}