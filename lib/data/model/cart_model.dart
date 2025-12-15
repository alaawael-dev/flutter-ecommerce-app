class CartModel {
  int? itemsprice;
  int? itemscount;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
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

  CartModel({
    this.itemsprice,
    this.itemscount,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
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
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    itemscount = json['itemscount'] is String
        ? int.tryParse(json['itemscount'])
        : json['itemscount'];

    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];

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
  }

  Map<String, dynamic> toJson() {
    return {
      'itemsprice': itemsprice,
      'itemscount': itemscount,
      'cart_id': cartId,
      'cart_usersid': cartUsersid,
      'cart_itemsid': cartItemsid,
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
    };
  }
}
