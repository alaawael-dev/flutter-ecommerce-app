class ItemModel {
  final int itemsId;
  final String itemsName;
  final String itemsNameAr;
  final String itemsDesc;
  final String itemsDescAr;
  final int itemsQuantity;
  final int itemsActive;
  final String itemsImage;
  final double itemsPrice;
  final int itemsDiscount;
  final String itemsDate;
  final int itemsCat;
  final double itemsAfterDiscount;

  final int categoriesId;
  final String categoriesName;
  final String categoriesNameAr;
  final String categoriesImage;
  final String categoriesDatetime;

  ItemModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsNameAr,
    required this.itemsDesc,
    required this.itemsDescAr,
    required this.itemsQuantity,
    required this.itemsActive,
    required this.itemsImage,
    required this.itemsPrice,
    required this.itemsDiscount,
    required this.itemsDate,
    required this.itemsCat,
    required this.itemsAfterDiscount,
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesImage,
    required this.categoriesDatetime,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsQuantity: json['items_quantity'],
      itemsActive: json['items_active'],
      itemsImage: json['items_image'],
      itemsPrice: (json['items_price'] as num).toDouble(),
      itemsDiscount: json['items_discount'],
      itemsDate: json['items_date'],
      itemsAfterDiscount: json['items_after_discount'] != null
    ? (json['items_after_discount'] as num).toDouble()
    : (json['items_price'] as num).toDouble(),

      itemsCat: json['items_cat'],
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesImage: json['categories_image'],
      categoriesDatetime: json['categories_datetime'],
    );
  }
}
