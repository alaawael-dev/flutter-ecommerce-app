import 'package:ecommerce/controller/auth/successresetpassword_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customebuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(
      SuccessResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Successful'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColor.primarycolor,
              size: 200,
            ),
            SizedBox(height: 20),
            CustomTitleAuth(title: "Password changed successfully!"),
            SizedBox(height: 10),
            CustomBodyAuth(body: "Login now to begin your journey"),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                buttonText: "Login now",
                onPressed: () {
                  controller.Login();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
