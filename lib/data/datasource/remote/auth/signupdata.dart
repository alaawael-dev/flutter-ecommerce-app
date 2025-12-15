import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String email, String password, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "email": email, 
      "password": password, 
      "phone": phone, 
    });
    return response.fold((l) => l, (r) => r);
  }
}
