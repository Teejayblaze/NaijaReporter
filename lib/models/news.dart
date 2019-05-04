import 'package:flutter/material.dart';
import 'news_similarity.dart';

class NaijaReportersNews {
  final String imagePath;
  final String title;
  final String subtitle;
  final int id;
  final Color bgColor;
  final String duration;
  final String category;
  final List<NaijaReportersNewsSimilarity> similarity;

  NaijaReportersNews({
    this.id,
    this.imagePath,
    this.title,
    this.subtitle,
    this.bgColor,
    this.duration,
    this.category,
    this.similarity,
  });

  NaijaReportersNews.fromJson(Map<String, dynamic> json):
      id = json['id'],
      imagePath = json['imagePath'],
      title = json['title'],
      subtitle = json['subtitle'],
      bgColor = json['bgColor'],
      duration = json['duration'],
      category = json['category'],
      similarity = json['similarity'] != null ?
                    json['similarity'].map<NaijaReportersNewsSimilarity>((e) =>
                    NaijaReportersNewsSimilarity.fromJson(e)).toList()
                  : null;
}