import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addData(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.addCart, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.deleteCart, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCount(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.getCount, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  view(String usersid) async {
    var response = await crud.postData(AppLink.viewCart, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  getCoupon(String couponName) async {
    var response = await crud.postData(AppLink.getCoupon, {
      "couponname": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
