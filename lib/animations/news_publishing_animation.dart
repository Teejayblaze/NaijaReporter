import 'package:flutter/material.dart';

class NaijaReportersNewsPublishingAnimationPhase1 {

  NaijaReportersNewsPublishingAnimationPhase1({this.controller}): fadeHeadlineText1 = Tween<double>(
      begin: 0.0,
      end: 1.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.10, 0.20, curve: Curves.easeOut))),

  fadesublineText1 = Tween<double>(
      begin: 0.0,
      end: 0.75
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.20, 0.30, curve: Curves.easeOut))),

  fadesublineText2 = Tween<double>(
      begin: 0.0,
      end: 0.57
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.30, 0.40, curve: Curves.easeOut))),

  fadesublineButton = Tween<double>(
      begin: 0.0,
      end: 1.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.40, 0.45, curve: Curves.easeOut)));

  final AnimationController controller;
  final Animation<double> fadeHeadlineText1;
  final Animation<double> fadesublineText1;
  final Animation<double> fadesublineText2;
  final Animation<double> fadesublineButton;
}


class NaijaReportersNewsPublishingAnimationPhase2 {

  NaijaReportersNewsPublishingAnimationPhase2({this.controller}): fadeHeadlineText1 = Tween<double>(
      begin: 0.0,
      end: 1.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.02, 0.10, curve: Curves.easeOut))),

  fadesublineText1 = Tween<double>(
      begin: 0.0,
      end: 0.75
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.10, 0.25, curve: Curves.easeOut))),

  fadesublineDropdown = Tween<double>(
      begin: 0.0,
      end: 1.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.25, 0.32, curve: Curves.elasticOut))),

  fadesublineButton = Tween<double>(
      begin: 0.0,
      end: 1.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.32, 0.37, curve: Curves.elasticOut)));

  final AnimationController controller;
  final Animation<double> fadeHeadlineText1;
  final Animation<double> fadesublineText1;
  final Animation<double> fadesublineDropdown;
  final Animation<double> fadesublineButton;
}