import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customebuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customsignuporlogin.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
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
              CustomTitleAuth(title: "W E L C O M E  B A C K"),
              CustomBodyAuth(body: "T O"),
              SizedBox(height: 5),
              CustomTitleAuth(title: "A  U  R  A"),
              SizedBox(height: 10),
              CustomBodyAuth(
                body:
                    "Sign in with your Email and Password OR continue with Social Media",
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
              CustomTextFormAuth(
                hinttext: 'Enter Your Password',
                label: 'Password',
                iconData: Icons.lock_outline,
                mycontroller: controller.password,
                valid: (val) {
                  return validInput(val!, 6, 20, "password");
                },
              ),
              InkWell(
                onTap: () {
                  controller.forgetPasswordPage();
                },
                child: Text(
                  "Forget Password",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              CustomButtonAuth(
                buttonText: "Sign In",
                onPressed: () {
                  controller.login();
                },
              ),
              CustomSignUpOrLogIn(
                textone: "Don't have an account yet? ",
                texttwo: "Sign up",
                onTap: () {
                  controller.signUpPage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
