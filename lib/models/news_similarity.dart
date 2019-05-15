class NaijaReportersNewsSimilarity {
  final String imagePath;
  final String title;
  final int id;
  final String duration;
  final String authorName;

  NaijaReportersNewsSimilarity({
    this.id,
    this.imagePath,
    this.title,
    this.duration,
    this.authorName,
  });

  NaijaReportersNewsSimilarity.fromJson(Map<String, dynamic> json):
        id = json['id'],
        imagePath = json['imagePath'],
        title = json['title'],
        duration = json['duration'].toString(),
        authorName = json['authorName'];
}