import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeTitle extends StatelessWidget {
  final String title;
  const CustomHomeTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.primarycolor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
