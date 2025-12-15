import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/consts/strings.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/forget%20password/verifycode_reset_pass_data.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  verifyCode();
  resetPasswordPage(String verificationCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? mail;
  VerifyCodeResetPasswordData verifyCodeResetPasswordData =
      VerifyCodeResetPasswordData(Get.find());
  StatusRequest? statusRequest;

  @override
  verifyCode() {}

  @override
  resetPasswordPage(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeResetPasswordData.postData(
      mail!,
      verificationCode,
    );
    print("$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.resetPassword, arguments: {
          "email" : mail
        });
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
