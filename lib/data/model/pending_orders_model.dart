class PendingOrderModel {
  final int ordersId;
  final int ordersAddress;
  final int ordersUsersid;
  final double ordersPrice;
  final int ordersPaymentmethod;
  final double ordersShippingprice;
  final double ordersTotalprice;
  final int ordersCoupon;
  final int ordersStatus;
  final int ordersType;
  final DateTime ordersDate;

  PendingOrderModel({
    required this.ordersId,
    required this.ordersAddress,
    required this.ordersUsersid,
    required this.ordersPrice,
    required this.ordersPaymentmethod,
    required this.ordersShippingprice,
    required this.ordersTotalprice,
    required this.ordersCoupon,
    required this.ordersStatus,
    required this.ordersType,
    required this.ordersDate,
  });

  factory PendingOrderModel.fromJson(Map<String, dynamic> json) {
    return PendingOrderModel(
      ordersId: json['orders_id'],
      ordersAddress: json['orders_address'],
      ordersUsersid: json['orders_usersid'],
      ordersPrice: (json['orders_price'] as num).toDouble(),
      ordersPaymentmethod: json['orders_paymentmethod'],
      ordersShippingprice:
          (json['orders_shippingprice'] as num).toDouble(),
      ordersTotalprice:
          (json['orders_totalprice'] as num).toDouble(),
      ordersCoupon: json['orders_coupon'],
      ordersStatus: json['orders_status'],
      ordersType: json['orders_type'],
      ordersDate: DateTime.parse(
        json['orders_date'].replaceAll('\n', ' '),
      ),
    );
  }
}
