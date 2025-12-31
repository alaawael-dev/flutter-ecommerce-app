import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  addOrder(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
