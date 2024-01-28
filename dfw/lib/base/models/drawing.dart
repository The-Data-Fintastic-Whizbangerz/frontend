import 'dart:ui';

import 'package:flutter/material.dart';

class DrawingArea {
  Offset point;
  Paint areaPaint;
  DrawingArea({
    required this.point,
    required this.areaPaint,
  });
}

class LetPaint extends CustomPainter {
  List<DrawingArea?> areas;

  LetPaint({
    required this.areas,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);

    for (int i = 0; i < areas.length - 1; i++) {
      if (areas[i] != null && areas[i + 1] != null) {
        canvas.drawLine(
            areas[i]!.point, areas[i + 1]!.point, areas[i]!.areaPaint);
      } else if (areas[i] != null && areas[i + 1] == null) {
        canvas.drawPoints(
            PointMode.points, [areas[i]!.point], areas[i]!.areaPaint);
      }
    }
  }

  @override
  bool shouldRepaint(LetPaint oldDelegate) => oldDelegate.areas != areas;
}
