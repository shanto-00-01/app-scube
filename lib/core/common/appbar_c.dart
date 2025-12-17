import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:app_scube/core/helper/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/text_font_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actionsWidgets;

  const CustomAppBar({super.key, this.title, this.actionsWidgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: IconButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            NavigationService.goBackV;
          },
          icon: Icon(Icons.arrow_back, color: AppColors.c04063E, size: 24.sp),
        ),
      ),
      elevation: 0,
      centerTitle: true,
      title: Text(title ?? ''),
      titleTextStyle: TextFontStyle.text16c04063EInter500,
      actions: actionsWidgets ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
