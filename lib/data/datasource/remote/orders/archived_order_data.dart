import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class ArchivedOrderData {
  Crud crud;
  ArchivedOrderData(this.crud);

  getArchivedOrders(String usersid) async {
    var response = await crud.postData(AppLink.viewArchived, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}