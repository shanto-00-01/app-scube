// --- Custom Gauge Painter ---
import 'dart:math';

import 'package:app_scube/core/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/text_font_style.dart';

class CustomGauge extends StatelessWidget {
  final double currentValue;
  final double maxValue;
  final String lebel;
  const CustomGauge({
    super.key,
    required this.currentValue,
    required this.maxValue,
    required this.lebel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      height: 160.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(160.w, 160.h),
            painter: GaugePainter(
              percent: currentValue / maxValue,
              progressColor: AppColors.c0096FC,
              backgroundColor: AppColors.cE5F4FE,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentValue.toStringAsFixed(2),
                style: TextFontStyle.text16c04063EInter500,
              ),
              Text(lebel, style: TextFontStyle.text16c04063EInter500),
            ],
          ),
        ],
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double percent;
  final Color progressColor;
  final Color backgroundColor;

  GaugePainter({
    required this.percent,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 18;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (size.width - strokeWidth) / 2;

    final Paint bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    final Paint fgPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    const double startAngle = 135 * (pi / 180);
    const double sweepAngle = 270 * (pi / 180);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      bgPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle * percent,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
