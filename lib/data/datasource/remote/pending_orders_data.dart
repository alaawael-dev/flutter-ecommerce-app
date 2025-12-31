import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);

  getOrders(String usersid) async {
    var response = await crud.postData(AppLink.viewPending, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
