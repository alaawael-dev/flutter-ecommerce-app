class AddressModel {
  final int addressId;
  final int userId;
  final String type;
  final String city;
  final String street;
  final double latitude;
  final double longitude;

  AddressModel({
    required this.addressId,
    required this.userId,
    required this.type,
    required this.city,
    required this.street,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressId: json['address_id'],
      userId: json['address_usersid'],
      type: json['address_type'],
      city: json['address_city'],
      street: json['address_street'],
      latitude: json['address_lat'].toDouble(),
      longitude: json['address_long'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "address_id": addressId,
      "address_usersid": userId,
      "address_type": type,
      "address_city": city,
      "address_street": street,
      "address_lat": latitude,
      "address_long": longitude,
    };
  }
}
