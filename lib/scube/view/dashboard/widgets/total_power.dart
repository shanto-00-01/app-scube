import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_scube/core/constant/text_font_style.dart';
import 'package:app_scube/core/gen/colors.gen.dart';

class PowerWidget extends StatelessWidget {
  const PowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                                height: 130.h,
                                width: 110.w,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 130.h,
                                      width: 110.w,
                                      child: CircularProgressIndicator(
                                        value: 1,
                                        strokeWidth: 8.r,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                        ),
                                        color: AppColors.c0096FC,
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 2.w,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Total Power",
                                              style: TextFontStyle
                                                  .text12c04063EInter400,
                                            ),
                                            Text(
                                              "5.53 Kw",
                                              style: TextFontStyle
                                                  .text16c04063EInter500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
;
  }
}
