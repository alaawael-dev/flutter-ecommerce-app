class CategoryModel {
  final int categoriesId;
  final String categoriesName;
  final String categoriesNameAr;
  final String categoriesImage;
  final DateTime categoriesDatetime;

  CategoryModel({
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesImage,
    required this.categoriesDatetime,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesImage: json['categories_image'],
      categoriesDatetime: DateTime.parse(json['categories_datetime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_image': categoriesImage,
      'categories_datetime': categoriesDatetime.toIso8601String(),
    };
  }
}
