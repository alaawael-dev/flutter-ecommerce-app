import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/consts/strings.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  Signup();
  logInPage();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;

  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  SignupData signupData = SignupData(Get.find());
  StatusRequest? statusRequest;
  List data = [];

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  Signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        username.text,
        email.text,
        password.text,
        phone.text,
      );
      print("$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          data.addAll(response['data']);
          Get.offAllNamed(
            AppRoute.verifyCodeSignUp,
            arguments: {"email": email.text},
          );
        } else {
          Get.snackbar(AppStrings.warning, AppStrings.emailPass);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      // Get.delete<SignUpControllerImp>();
    } else {
      print("object");
    }
  }

  @override
  logInPage() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
