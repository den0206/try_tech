import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> {
  double percentage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CirculatProgress'),
      ),
      body: Center(
        child: CirculaProgress(
          percentage: percentage,
          progressColor: Colors.red,
          strokeWidth: 20,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (percentage < 100) percentage += 10;
          });
        },
      ),
    );
  }
}

class CirculaProgress extends StatefulWidget {
  CirculaProgress({
    Key? key,
    required this.percentage,
    this.size = 300,
    this.strokeWidth = 12,
    this.progressColor = Colors.red,
  }) : super(key: key);

  final double percentage;
  final Color progressColor;
  final double size;
  final double strokeWidth;

  @override
  State<CirculaProgress> createState() => _CirculaProgressState();
}

class _CirculaProgressState extends State<CirculaProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double currentPercentage;

  @override
  void initState() {
    currentPercentage = widget.percentage;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final differenceAnimation = widget.percentage - currentPercentage;
    currentPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(15),
          height: widget.size,
          width: widget.size,
          child: CustomPaint(
            painter: _RadialProgres(
              percentage: (widget.percentage - differenceAnimation) +
                  (differenceAnimation * controller.value),
              progressColor: widget.progressColor,
              strokeWidth: widget.strokeWidth,
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgres extends CustomPainter {
  _RadialProgres({
    required this.percentage,
    required this.progressColor,
    required this.strokeWidth,
  });

  final double percentage;
  final Color progressColor;
  final double strokeWidth;
  @override
  void paint(Canvas canvas, Size size) {
    // paint Circle
    final underpen = Paint()
      ..strokeWidth = strokeWidth
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, underpen);

    final overPen = Paint()
      ..strokeWidth = strokeWidth
      ..color = progressColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      overPen,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
