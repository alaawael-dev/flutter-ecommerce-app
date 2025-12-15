import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/consts/imageassets.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customebuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customsignuporlogin.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
            ? Center(child: Lottie.asset(AppImageAssets.loading))
            : Container(
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
                            "Sign up with your Email and Password OR continue with Social Media",
                      ),
                      SizedBox(height: 55),
                      CustomTextFormAuth(
                        hinttext: 'Enter Your Username',
                        label: 'Username',
                        iconData: Icons.person_outlined,
                        mycontroller: controller.username,
                        valid: (val) {
                          return validInput(val!, 5, 20, "username");
                        },
                      ),
                      CustomTextFormAuth(
                        hinttext: 'Enter Your Email',
                        label: 'Email',
                        iconData: Icons.email_outlined,
                        mycontroller: controller.email,
                        valid: (val) {
                          return validInput(val!, 5, 20, "email");
                        },
                      ),
                      CustomTextFormAuth(
                        hinttext: 'Enter Your Phone',
                        label: 'Phone',
                        iconData: Icons.phone_outlined,
                        mycontroller: controller.phone,
                        keyboardType: TextInputType.phone,
                        valid: (val) {
                          return validInput(val!, 11, 15, "phone");
                        },
                      ),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          hinttext: 'Enter Your Password',
                          mycontroller: controller.password,
                          label: 'Password',
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          iconData: Icons.lock_outline,
                          valid: (val) {
                            return validInput(val!, 6, 20, "password");
                          },
                        ),
                      ),
                      CustomButtonAuth(
                        buttonText: "Sign up",
                        onPressed: () {
                          controller.Signup();
                        },
                      ),
                      CustomSignUpOrLogIn(
                        textone: "Already have an account yet? ",
                        texttwo: "Sign in",
                        onTap: () {
                          controller.logInPage();
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
