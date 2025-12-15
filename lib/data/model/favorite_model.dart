class FavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  int? itemsQuantity;
  int? itemsActive;
  String? itemsImage;
  double? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? usersId;

  FavoriteModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoriteItemsid,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsQuantity,
    this.itemsActive,
    this.itemsImage,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
    this.usersId,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];

    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsQuantity = json['items_quantity'];
    itemsActive = json['items_active'];
    itemsImage = json['items_image'];

    itemsPrice = json['items_price'] is int
        ? (json['items_price'] as int).toDouble()
        : json['items_price']?.toDouble();

    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];

    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'favorite_id': favoriteId,
      'favorite_usersid': favoriteUsersid,
      'favorite_itemsid': favoriteItemsid,
      'items_id': itemsId,
      'items_name': itemsName,
      'items_name_ar': itemsNameAr,
      'items_desc': itemsDesc,
      'items_desc_ar': itemsDescAr,
      'items_quantity': itemsQuantity,
      'items_active': itemsActive,
      'items_image': itemsImage,
      'items_price': itemsPrice,
      'items_discount': itemsDiscount,
      'items_date': itemsDate,
      'items_cat': itemsCat,
      'users_id': usersId,
    };
  }
}
