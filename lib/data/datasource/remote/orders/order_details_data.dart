import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.orderDetails, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}
