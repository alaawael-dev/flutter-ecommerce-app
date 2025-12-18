import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class TopTotalItems extends StatelessWidget {
  final String count;
  const TopTotalItems({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(top: 16),
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColor.primarycolor,
      ),
      child: Text(
        "You have total of $count items in your list",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
