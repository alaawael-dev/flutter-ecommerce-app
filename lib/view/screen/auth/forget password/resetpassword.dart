import 'package:ecommerce/controller/forget%20password/resetpassword_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customebuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetControllerImp controller = Get.put(SuccessResetControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              SizedBox(height: 30),
              CustomTitleAuth(title: "Reset your password"),
              SizedBox(height: 10),
              CustomBodyAuth(body: "Please Enter A New Password"),
              SizedBox(height: 55),
              CustomTextFormAuth(
                hinttext: 'Enter Your Password',
                label: 'password',
                iconData: Icons.lock_outlined,
                mycontroller: controller.password,
                valid: (val) {
                  return validInput(val!, 6, 20, "password");
                },
              ),
              CustomTextFormAuth(
                hinttext: 'Re-Enter Your Password',
                label: 'Re-Enter password',
                iconData: Icons.lock_outlined,
                mycontroller: controller.repassword,
                valid: (val) {
                  return validInput(val!, 6, 20, "password");
                },
              ),
              CustomButtonAuth(
                buttonText: "Save",
                onPressed: () {
                  controller.successResetPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
