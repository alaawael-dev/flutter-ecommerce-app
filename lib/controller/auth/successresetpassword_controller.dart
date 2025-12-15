import 'package:ecommerce/core/consts/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  Login();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  Login() {
    Get.offAllNamed(AppRoute.login);
  }
}
