import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CheckoutPaymentMethod extends StatelessWidget {
  final String method;
  final bool isActive;
  const CheckoutPaymentMethod({
    super.key,
    required this.method,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: isActive == true ? AppColor.secondColor : AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(method, style: TextStyle(color: isActive == true ? Colors.white : null, height: 1)),
    );
  }
}
