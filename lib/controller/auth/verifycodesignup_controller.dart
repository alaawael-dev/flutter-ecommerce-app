import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/consts/strings.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  verifyCode();
  successSignUpPage(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? mail;

  VerifyCodeSignUpData verifycodesignup = VerifyCodeSignUpData(Get.find());
  StatusRequest? statusRequest;

  List data = [];

  @override
  verifyCode() {}

  @override
  successSignUpPage(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodesignup.postData(mail!, verificationCode);
    print("$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        Get.snackbar(AppStrings.warning, AppStrings.wrongCode);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    mail = Get.arguments['email'];
    super.onInit();
  }
}
