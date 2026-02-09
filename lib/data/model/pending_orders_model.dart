class PendingOrderModel {
  final int ordersId;
  final int ordersAddress;
  final int ordersUsersId;
  final double ordersPrice;
  final int ordersPaymentMethod;
  final double ordersShippingPrice;
  final double ordersTotalPrice;
  final int ordersCoupon;
  final int ordersStatus;
  final int ordersType;
  final String ordersDate;

  final int? addressId;
  final int? addressUsersId;
  final String? addressType;
  final String? addressCity;
  final String? addressStreet;
  final double? addressLat;
  final double? addressLong;

  PendingOrderModel({
    required this.ordersId,
    required this.ordersAddress,
    required this.ordersUsersId,
    required this.ordersPrice,
    required this.ordersPaymentMethod,
    required this.ordersShippingPrice,
    required this.ordersTotalPrice,
    required this.ordersCoupon,
    required this.ordersStatus,
    required this.ordersType,
    required this.ordersDate,
    this.addressId,
    this.addressUsersId,
    this.addressType,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
  });

  factory PendingOrderModel.fromJson(Map<String, dynamic> json) {
    return PendingOrderModel(
      ordersId: json['orders_id'],
      ordersAddress: json['orders_address'],
      ordersUsersId: json['orders_usersid'],
      ordersPrice: (json['orders_price'] as num).toDouble(),
      ordersPaymentMethod: json['orders_paymentmethod'],
      ordersShippingPrice: (json['orders_shippingprice'] as num).toDouble(),
      ordersTotalPrice: (json['orders_totalprice'] as num).toDouble(),
      ordersCoupon: json['orders_coupon'],
      ordersStatus: json['orders_status'],
      ordersType: json['orders_type'],
      ordersDate: json['orders_date'],

      addressId: json['address_id'],
      addressUsersId: json['address_usersid'],
      addressType: json['address_type'],
      addressCity: json['address_city'],
      addressStreet: json['address_street'],
      addressLat: json['address_lat'] != null
          ? (json['address_lat'] as num).toDouble()
          : null,
      addressLong: json['address_long'] != null
          ? (json['address_long'] as num).toDouble()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders_id': ordersId,
      'orders_address': ordersAddress,
      'orders_usersid': ordersUsersId,
      'orders_price': ordersPrice,
      'orders_paymentmethod': ordersPaymentMethod,
      'orders_shippingprice': ordersShippingPrice,
      'orders_totalprice': ordersTotalPrice,
      'orders_coupon': ordersCoupon,
      'orders_status': ordersStatus,
      'orders_type': ordersType,
      'orders_date': ordersDate,
      'address_id': addressId,
      'address_usersid': addressUsersId,
      'address_type': addressType,
      'address_city': addressCity,
      'address_street': addressStreet,
      'address_lat': addressLat,
      'address_long': addressLong,
    };
  }
}
