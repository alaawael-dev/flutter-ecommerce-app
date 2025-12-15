import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class FavoritePageData {
  Crud crud;
  FavoritePageData(this.crud);

  getData(id) async {
    var response = await crud.postData(AppLink.viewFavorite, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }

  delete(id) async {
    var response = await crud.postData(AppLink.deleteFavPage, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}
