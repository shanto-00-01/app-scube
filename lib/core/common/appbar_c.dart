import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/text_font_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double elevation;
  final Function()? onBackPressed;
  final bool isCentered;
  final bool? isLeadingImg;
  final Widget? titleImageWidget;
  final List<Widget>? actionsWidgets; // = [];
  // ignore: prefer_typing_uninitialized_variables
  final isGoBackIcon;
  final Widget leadingWidget;
  final double? backIconLeftPadding;
  final Color? appbarBgColor;
  final TextStyle? titleTextStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.elevation = 0.0,
    this.onBackPressed,
    this.isCentered = false,
    this.isLeadingImg = false,
    this.titleImageWidget,
    this.actionsWidgets,
    this.isGoBackIcon = true,
    this.leadingWidget = const SizedBox(),
    this.backIconLeftPadding,
    this.appbarBgColor,
    this.titleTextStyle
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leadingWidget,
      elevation: 0,
      backgroundColor: appbarBgColor ?? AppColors.cWhite,
      centerTitle: isCentered,
      title: isLeadingImg == true
          ? titleImageWidget
          : Padding(
              padding: EdgeInsets.only(left: isGoBackIcon != true ? 8.w : 0.w),
              child: Text(title ?? ''),
            ),
      titleTextStyle:titleTextStyle ?? TextFontStyle.headline32c000000Inter700,
      actions: actionsWidgets ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
