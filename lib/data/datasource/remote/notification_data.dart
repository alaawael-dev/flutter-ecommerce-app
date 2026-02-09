import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.notifications, {"id" : id});
    return response.fold((l) => l, (r) => r);
  }
}
