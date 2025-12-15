import 'package:ecommerce/controller/forget%20password/forgetpassword_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customebuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
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
              CustomTitleAuth(title: "Check your email"),
              SizedBox(height: 10),
              CustomBodyAuth(
                body:
                    "Please Enter you email address to receive a verification code",
              ),
              SizedBox(height: 55),
              CustomTextFormAuth(
                hinttext: 'Enter Your Email',
                label: 'Email',
                iconData: Icons.email_outlined,
                mycontroller: controller.email,
                valid: (val) {
                  return validInput(val!, 12, 20, "email");
                },
              ),
              CustomButtonAuth(
                buttonText: "Check my Email",
                onPressed: () {
                  controller.checkEmail();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
