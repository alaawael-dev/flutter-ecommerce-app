import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id, String usersid) async {
    var response = await crud.postData(AppLink.items, {"id" : id, "usersid" : usersid});
    return response.fold((l) => l, (r) => r);
  }
}
