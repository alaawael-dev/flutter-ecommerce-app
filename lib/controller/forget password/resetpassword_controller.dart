import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/consts/strings.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/forget%20password/resetpasswordData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SuccessResetController extends GetxController {
  resetpassword();
  successResetPage();
}

class SuccessResetControllerImp extends SuccessResetController {
  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest;

  @override
  resetpassword() {}

  @override
  successResetPage() async {
    if (password.text != repassword.text) {
      return Get.snackbar(AppStrings.warning, "Passwords don't match");
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offAllNamed(AppRoute.successResetPassword);
        } else {
          Get.snackbar(AppStrings.warning, "Something went wrong");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("object");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
