import 'news_similarity.dart';
import 'news_author.dart';

class NaijaReportersNews {
  final String imagePath;
  final String title;
  final String subtitle;
  final int id;
  final int bgColor;
  final String duration;
  final String category;
  final int read;
  final int upvote;
  final List<NaijaReportersNewsSimilarity> similarity;
  final NaijaReportersNewsAuthor author;

  NaijaReportersNews({
    this.id,
    this.imagePath,
    this.title,
    this.subtitle,
    this.bgColor,
    this.duration,
    this.category,
    this.similarity,
    this.read,
    this.upvote,
    this.author,
  });

  NaijaReportersNews.fromJson(Map<String, dynamic> json):
      id = json['id'],
      imagePath = json['imagePath'],
      title = json['title'],
      subtitle = json['subtitle'],
      bgColor = int.parse(json['bgColor']),
      duration = json['duration'].toString(),
      category = json['category'],
      read = json['read'],
      upvote = json['upvote'],
      similarity = json['similarity'].length > 0 ?
                    json['similarity'].map<NaijaReportersNewsSimilarity>((e) =>
                    NaijaReportersNewsSimilarity.fromJson(e)).toList()
                  : null,
      author = json['author'].length > 0 ? NaijaReportersNewsAuthor.fromJson(json['author']) : null;
}