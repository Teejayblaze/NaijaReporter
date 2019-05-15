import 'package:flutter/material.dart';

class NaijaReportersNewsRewardCoinAnimation {

  NaijaReportersNewsRewardCoinAnimation({this.controller, this.size}): translateCoin1 = Tween<Offset>(
      begin: Offset(-105.0, 1.0),
      end: Offset(((size.width/2) - 20), 1.0)
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.00, 0.30, curve: Curves.easeIn))),

  rotateCoin1 = Tween<double>(
      begin: -20.0,
      end: 0.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.00, 0.30, curve: Curves.easeOut))),

  translateCoin2 = Tween<Offset>(
      begin: Offset(-105.0, 1.0),
      end: Offset(((size.width/2) - 90), 1.0)
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.30, 0.70, curve: Curves.easeIn))),

  rotateCoin2 = Tween<double>(
      begin: -20.0,
      end: 0.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.30, 0.70, curve: Curves.easeOut))),

  fadeAmount = Tween<double>(
      begin: 0.0,
      end: 1.0
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.70, 0.80, curve: Curves.easeOut))),

  growText = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 1.0)
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.80, 0.90, curve: Curves.elasticOut))),

  growButton = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1.0, 1.0)
  ).animate(new CurvedAnimation(parent: controller, curve: Interval(0.90, 0.96, curve: Curves.elasticOut)));

  final AnimationController controller;

  final Animation<Offset> translateCoin1;
  final Animation<double> rotateCoin1;

  final Animation<Offset> translateCoin2;
  final Animation<double> rotateCoin2;

  final Animation<double> fadeAmount;
  final Animation<Offset> growText;
  final Animation<Offset> growButton;

  final Size size;
}