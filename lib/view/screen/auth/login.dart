import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customebuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: [
            SizedBox(height: 30),
            CustomTitleAuth(title: "W E L C O M E  B A C K"),
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
            ),
            CustomTextFormAuth(
              hinttext: 'Enter Your Password',
              label: 'Password',
              iconData: Icons.lock_outline,
            ),
            Text(
              "Forget Password",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 12),
            ),
            CustomButtonAuth(buttonText: "Sign In", onPressed: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account yet? "),
                InkWell(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
