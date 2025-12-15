import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomCountContainer extends StatelessWidget {
  final String title;
  const CustomCountContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.center,
        height: 70,
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.primarycolor,
          ),
        ),
      ),
    );
  }
}
