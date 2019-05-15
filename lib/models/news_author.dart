class NaijaReportersNewsAuthor {
  final String imagePath;
  final String name;
  final int id;
  final String description;

  NaijaReportersNewsAuthor({
    this.id,
    this.imagePath,
    this.name,
    this.description
  });

  NaijaReportersNewsAuthor.fromJson(Map<String, dynamic> json):
        id = json['id'],
        imagePath = json['imagePath'],
        name = json['name'],
        description = json['description'];
}