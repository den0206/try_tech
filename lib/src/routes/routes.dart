import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:try_tech/src/screen/animation/animation_screen.dart';
import 'package:try_tech/src/screen/circular_progress/circular_progress_screen.dart';
import 'package:try_tech/src/screen/emergency/emergency_screen.dart';
import 'package:try_tech/src/screen/paint_header/paint_header_screen.dart';
import 'package:try_tech/src/screen/pintest/pintest_screen.dart';
import 'package:try_tech/src/screen/slide_show/slide_show_screen.dart';

import '../screen/animate_do/animate_do_screen.dart';
import '../screen/sliver/sliver_screen.dart';

final List<_Route> pageRoutes = [
  _Route(
    iconData: FontAwesomeIcons.slideshare,
    title: "Slide SHow",
    page: SlideShowScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.s,
    title: "Emergency",
    page: EmergencyScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.heading,
    title: "Paint Header Screen",
    page: PaintHeaderScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.peopleCarryBox,
    title: "Animation",
    page: AnimationScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.slideshare,
    title: "Animation_Do",
    page: AnimateDoScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.circleNotch,
    title: "Circula Progress",
    page: CircularProgressScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.pinterest,
    title: "Pintest",
    page: PintestScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.slideshare,
    title: "Slide Show",
    page: SlideShowScreen(),
  ),
  _Route(
    iconData: FontAwesomeIcons.mobile,
    title: "SLiver",
    page: SliverScreen(),
  ),
];

class _Route {
  final IconData iconData;
  final String title;
  final Widget page;
  _Route({
    required this.iconData,
    required this.title,
    required this.page,
  });
}
