

import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFontStyle {
  TextFontStyle._internal();

  static final headline32cFFFFFFInter700 = GoogleFonts.inter(
    color: AppColors.cWhite,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700
  );

  static final headline32c000000Inter700 = GoogleFonts.inter(
    color: AppColors.cBlack,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700
  );
}