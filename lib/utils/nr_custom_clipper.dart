import 'package:flutter/material.dart';

class NaijaReporterCustomClipper extends CustomClipper<Path> {

  Path path = new Path();

  @override
  Path getClip(Size size) {

    double preHeight = (size.height - 50);

    path.lineTo(0.0, preHeight);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();

    return this.path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}