import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CheckoutDeliveryMethod extends StatelessWidget {
  final String image;
  final String method;
  final bool isActive;
  const CheckoutDeliveryMethod({
    super.key,
    required this.image,
    required this.method,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive == true ? AppColor.secondColor : AppColor.thirdColor,
        border: isActive == false
            ? Border.all(color: AppColor.secondColor, width: 2)
            : null,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 80,
            width: 80,
            color: isActive == true ? Colors.white : AppColor.secondColor,
          ),
          Text(
            method,
            style: TextStyle(color: isActive == true ? Colors.white : null),
          ),
        ],
      ),
    );
  }
}
