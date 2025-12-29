import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getAddress(String usersId) async {
    var response = await crud.postData(AppLink.getAddress, {
      "usersid": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  addAddress(
    String usersId,
    String type,
    String city,
    String street,
    String long,
    String lat,
  ) async {
    var response = await crud.postData(AppLink.addAddress, {
      "usersid": usersId,
      "type": type,
      "street": street,
      "city": city,
      "long": long,
      "lat": lat,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressId) async {
    var response = await crud.postData(AppLink.deleteAddress, {"addressid": addressId});
    return response.fold((l) => l, (r) => r);
  }
}
