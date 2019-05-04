import 'package:flutter/material.dart';

class NaijaReportersNewsSimilarity {
  final String imagePath;
  final String title;
  final int id;
  final String duration;

  NaijaReportersNewsSimilarity({
    this.id,
    this.imagePath,
    this.title,
    this.duration
  });

  NaijaReportersNewsSimilarity.fromJson(Map<String, dynamic> json):
        id = json['id'],
        imagePath = json['imagePath'],
        title = json['title'],
        duration = json['duration'];
}