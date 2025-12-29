import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CheckoutTitle extends StatelessWidget {
  final String title;
  const CheckoutTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColor.secondColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
