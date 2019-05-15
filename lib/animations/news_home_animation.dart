import 'package:flutter/material.dart';

class NaijaReportersNewsHomeAnimation {

  NaijaReportersNewsHomeAnimation({this.controller}): growText = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 1.0)
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.20, 0.50, curve: Curves.elasticOut))),

  fadeText = Tween<double>(
      begin: 0.0,
      end: 0.7
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.50, 0.60, curve: Curves.easeOut)));

  final AnimationController controller;
  final Animation<Offset> growText;
  final Animation<double> fadeText;
}