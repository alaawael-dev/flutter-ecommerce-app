import 'package:ecommerce/controller/forget%20password/verifycode_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify Code",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: ListView(
          children: [
            SizedBox(height: 30),
            CustomTitleAuth(title: "Check you email "),
            SizedBox(height: 10),
            CustomBodyAuth(
              body:
                  "Enter the verification code you received at ${controller.mail}",
            ),
            SizedBox(height: 55),
            OtpTextField(
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.resetPasswordPage(verificationCode);
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
