import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        color: AppColor.primarycolor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}
