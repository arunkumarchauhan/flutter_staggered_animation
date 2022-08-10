import 'package:flutter/material.dart';

class LightPainter extends CustomPainter {
  final Color color;
  LightPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();
    paint.color = color;

    path.lineTo(65, 0);
    path.lineTo(100, 80);
    path.lineTo(-50, 80);
    path.lineTo(-15, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
