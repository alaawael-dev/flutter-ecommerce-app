import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
