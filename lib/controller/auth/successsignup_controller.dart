import 'package:ecommerce/core/consts/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  Login();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  Login() {
    Get.offAllNamed(AppRoute.login);
  }
}
