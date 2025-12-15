import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email, 
    });
    return response.fold((l) => l, (r) => r);
  }
}
