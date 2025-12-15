import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/consts/strings.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/logindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  signUpPage();
  forgetPasswordPage();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  LoginData loginData = LoginData(Get.find());
  StatusRequest? statusRequest;

  MyServices services = Get.find();

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          services.sharedPref.setString(
            "id",
            response['data']['users_id'].toString(),
          );
          services.sharedPref.setString(
            "username",
            response['data']['users_name'],
          );
          services.sharedPref.setString(
            "email",
            response['data']['users_email'],
          );
          services.sharedPref.setString(
            "phone",
            response['data']['users_phone'],
          );
          services.sharedPref.setString("step", '2');
          Get.offAllNamed(AppRoute.home);
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
  forgetPasswordPage() {
    Get.offNamed(AppRoute.forgetPassword);
  }

  @override
  signUpPage() {
    Get.toNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
