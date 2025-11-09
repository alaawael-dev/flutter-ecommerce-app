import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomOnBoardingButton extends GetView<OnBoardingControllerImp> {
  const CustomOnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 60),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 80),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primarycolor,
        textColor: Colors.white,
        child: Text("Let's go!"),
      ),
    );
  }
}
