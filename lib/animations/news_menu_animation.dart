import 'package:flutter/material.dart';

class NaijaReportersNewsMenuSlideAnimation {

  NaijaReportersNewsMenuSlideAnimation({this.controller, this.size}): translateNewsBody = Tween<Offset>(
      begin: Offset(1.0, 1.0),
      end: Offset((size.width-100), 1.0)
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.00, 0.10, curve: Curves.easeIn))),

  revealMenuBar = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 1.0)
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.15, 0.20, curve: Curves.elasticOut)));

  final AnimationController controller;
  final Animation<Offset> translateNewsBody;
  final Animation<Offset> revealMenuBar;
  final Size size;
}