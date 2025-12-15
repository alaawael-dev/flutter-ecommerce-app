import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class FavortieData {
  Crud crud;
  FavortieData(this.crud);

  addData(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.addFavorite, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.removeFavorite, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
