class NaijaReportersNewsCategory {
  final String category;
  final int icon;
  final String fontFamily;
  final int id;

  NaijaReportersNewsCategory({
    this.id,
    this.category,
    this.icon,
    this.fontFamily
  });

  NaijaReportersNewsCategory.fromJson(Map<String, dynamic> json):
        id = json['id'],
        category = json['category'],
        icon = int.parse(json['icon']),
        fontFamily = json['font_family'] ?? 'icofont' ;
}