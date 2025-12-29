class CouponModel {
  final int couponId;
  final String couponName;
  final int couponCount;
  final String couponExpDate;
  final int couponDiscount;

  CouponModel({
    required this.couponId,
    required this.couponName,
    required this.couponCount,
    required this.couponExpDate,
    required this.couponDiscount,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      couponId: json['coupon_id'],
      couponName: json['coupon_name'],
      couponCount: json['coupon_count'],
      couponExpDate: json['coupon_expdate'],
      couponDiscount: json['coupon_discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "coupon_id": couponId,
      "coupon_name": couponName,
      "coupon_count": couponCount,
      "coupon_expdate": couponExpDate,
      "coupon_discount": couponDiscount,
    };
  }
}
