// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.3266133, size.height * 0.1111111);
    path_0.cubicTo(
      size.width * 0.1781363,
      size.height * 0.1111111,
      size.width * -0.01866667,
      size.height * 0.1160433,
      size.width * -0.01866667,
      size.height * 0.1160433,
    );
    path_0.lineTo(size.width * -0.01866667, size.height * 0.9333333);
    path_0.lineTo(size.width * 1.021333, size.height * 0.9333333);
    path_0.lineTo(size.width * 1.021333, size.height * 0.1160433);
    path_0.cubicTo(
      size.width * 1.021333,
      size.height * 0.1160433,
      size.width * 0.8216773,
      size.height * 0.1111111,
      size.width * 0.6663467,
      size.height * 0.1111111,
    );
    path_0.cubicTo(
      size.width * 0.5914667,
      size.height * 0.1111111,
      size.width * 0.5734400,
      size.height * 0.4655978,
      size.width * 0.5013333,
      size.height * 0.4655978,
    );
    path_0.cubicTo(
      size.width * 0.4292267,
      size.height * 0.4655978,
      size.width * 0.4056533,
      size.height * 0.1111110,
      size.width * 0.3266133,
      size.height * 0.1111111,
    );
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
