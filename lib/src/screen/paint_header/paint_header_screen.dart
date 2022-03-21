import 'package:flutter/material.dart';

class PaintHeaderScreen extends StatelessWidget {
  const PaintHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CommonHeader());
  }
}

class CommonHeader extends StatelessWidget {
  const CommonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _HeaderWavePainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();
    pen.color = Colors.purple;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5;

    final path = Path();
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();
    pen.color = Colors.purple;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5;

    final path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();
    pen.color = Colors.purple;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width / 2, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();
    pen.color = Colors.purple;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.4, size.width, size.height * 0.2);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();
    pen.color = Colors.purple;
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.25, size.width / 2, size.height * 0.2);
    path.quadraticBezierTo((size.width / 4) * 3, size.height * 0.15, size.width,
        size.height * 0.2);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
