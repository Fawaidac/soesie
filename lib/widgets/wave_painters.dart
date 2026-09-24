import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class TopWavePainter extends CustomPainter {
  final Color color;

  TopWavePainter({this.color = AppColors.primary});

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / 390.0;
    final double scaleY = size.height / 190.0;

    // Layer 1: Background light sage swell (12% opacity)
    final paint1 = Paint()
      ..color = color.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;
    final path1 = Path()
      ..moveTo(0, 0)
      ..lineTo(390 * scaleX, 0)
      ..lineTo(390 * scaleX, 135 * scaleY)
      ..cubicTo(
        335.5 * scaleX,
        168 * scaleY,
        268.5 * scaleX,
        142 * scaleY,
        195 * scaleX,
        106 * scaleY,
      )
      ..cubicTo(
        121.5 * scaleX,
        70 * scaleY,
        54 * scaleX,
        88 * scaleY,
        0,
        115 * scaleY,
      )
      ..close();
    canvas.drawPath(path1, paint1);

    // Layer 2: Mid-tone mint ripple (28% opacity)
    final paint2 = Paint()
      ..color = color.withValues(alpha: 0.28)
      ..style = PaintingStyle.fill;
    final path2 = Path()
      ..moveTo(0, 0)
      ..lineTo(390 * scaleX, 0)
      ..lineTo(390 * scaleX, 92 * scaleY)
      ..cubicTo(
        324.5 * scaleX,
        138 * scaleY,
        238.5 * scaleX,
        148 * scaleY,
        165 * scaleX,
        110 * scaleY,
      )
      ..cubicTo(
        91.5 * scaleX,
        72 * scaleY,
        38 * scaleX,
        78 * scaleY,
        0,
        85 * scaleY,
      )
      ..close();
    canvas.drawPath(path2, paint2);

    // Layer 3: Foreground surgical emerald wave (90% opacity)
    final paint3 = Paint()
      ..color = color.withValues(alpha: 0.90)
      ..style = PaintingStyle.fill;
    final path3 = Path()
      ..moveTo(0, 0)
      ..lineTo(390 * scaleX, 0)
      ..lineTo(390 * scaleX, 65 * scaleY)
      ..cubicTo(
        305 * scaleX,
        118 * scaleY,
        220 * scaleX,
        126 * scaleY,
        142 * scaleX,
        82 * scaleY,
      )
      ..cubicTo(
        64 * scaleX,
        38 * scaleY,
        28 * scaleX,
        50 * scaleY,
        0,
        54 * scaleY,
      )
      ..close();
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(covariant TopWavePainter oldDelegate) =>
      oldDelegate.color != color;
}

class BottomWavePainter extends CustomPainter {
  final Color color;

  BottomWavePainter({this.color = AppColors.primary});

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / 390.0;
    final double scaleY = size.height / 120.0;

    // Layer 1 (10% opacity)
    final paint1 = Paint()
      ..color = color.withValues(alpha: 0.10)
      ..style = PaintingStyle.fill;
    final path1 = Path()
      ..moveTo(0, 0)
      ..lineTo(390 * scaleX, 0)
      ..lineTo(390 * scaleX, 60 * scaleY)
      ..cubicTo(
        310 * scaleX,
        110 * scaleY,
        215 * scaleX,
        118 * scaleY,
        135 * scaleX,
        75 * scaleY,
      )
      ..cubicTo(
        60 * scaleX,
        35 * scaleY,
        25 * scaleX,
        45 * scaleY,
        0,
        50 * scaleY,
      )
      ..close();
    canvas.drawPath(path1, paint1);

    // Layer 2 (75% opacity)
    final paint2 = Paint()
      ..color = color.withValues(alpha: 0.75)
      ..style = PaintingStyle.fill;
    final path2 = Path()
      ..moveTo(0, 0)
      ..lineTo(390 * scaleX, 0)
      ..lineTo(390 * scaleX, 40 * scaleY)
      ..cubicTo(
        295 * scaleX,
        95 * scaleY,
        210 * scaleX,
        98 * scaleY,
        120 * scaleX,
        50 * scaleY,
      )
      ..cubicTo(
        50 * scaleX,
        18 * scaleY,
        20 * scaleX,
        28 * scaleY,
        0,
        32 * scaleY,
      )
      ..close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant BottomWavePainter oldDelegate) =>
      oldDelegate.color != color;
}
