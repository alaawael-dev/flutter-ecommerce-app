import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/core/classes/crud.dart';

class VerifyCodeResetPasswordData {
  Crud crud;
  VerifyCodeResetPasswordData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.VerifyCodeResetPassword, {
      "email": email, 
      "verifycode": verifycode, 
    });
    return response.fold((l) => l, (r) => r);
  }
}
