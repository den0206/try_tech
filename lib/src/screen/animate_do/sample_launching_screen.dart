import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SampleLaunchingScreen extends StatelessWidget {
  const SampleLaunchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 67, 163, 241),
      body: Center(
        child: ZoomOut(
          from: 30,
          duration: Duration(seconds: 1),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {},
      ),
    );
  }
}
