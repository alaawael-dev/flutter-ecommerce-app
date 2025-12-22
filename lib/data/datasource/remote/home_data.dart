import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchItems(String search) async {
    var response = await crud.postData(AppLink.searchItems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
