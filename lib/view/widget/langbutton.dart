import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class MyCustomLanguageButton extends StatelessWidget {
  final String langKey;
  final void Function()? onPressed;
  const MyCustomLanguageButton({super.key, required this.langKey, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primarycolor,
        onPressed: onPressed,
        child: Text(
          langKey,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
