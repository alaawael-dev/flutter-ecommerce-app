import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CheckoutLocationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  const CheckoutLocationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: isActive == true ? AppColor.secondColor : AppColor.thirdColor,
      child: Container(
        child: ListTile(
          textColor: isActive == true ? Colors.white : null,
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
