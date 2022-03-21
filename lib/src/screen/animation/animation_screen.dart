import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: FadeAndRotateAnimation(),
      ),
    );
  }
}

class BlueRectangle extends StatelessWidget {
  const BlueRectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

class FadeAndRotateAnimation extends StatefulWidget {
  FadeAndRotateAnimation({Key? key}) : super(key: key);

  @override
  State<FadeAndRotateAnimation> createState() => _FadeAndRotateAnimationState();
}

class _FadeAndRotateAnimationState extends State<FadeAndRotateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> move;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceInOut),
    );
    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
          parent: controller,
          curve: Interval(0, 0.25, curve: Curves.easeInOut)),
    );
    opacityOut = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
          parent: controller,
          curve: Interval(0.75, 1.0, curve: Curves.easeInOut)),
    );

    move = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInBack),
    );
    scale = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );

    // controller.forward();
    controller.repeat();
    controller.addListener(() {
      switch (controller.status) {
        // case AnimationStatus.completed:
        //   controller.reverse();
        //   break;
        // case AnimationStatus.dismissed:
        //   controller.forward();
        //   break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: BlueRectangle(),
      builder: (BuildContext context, Widget? widget) {
        return Transform.translate(
          offset: Offset(move.value, 0),
          child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacity.value - opacityOut.value,
                child: Transform.scale(scale: scale.value, child: widget),
              )),
        );
      },
    );
  }
}
