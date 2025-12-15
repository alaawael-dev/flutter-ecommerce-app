import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeCard extends StatelessWidget {
  final String titleCard;
  final String bodyCard;
  const CustomHomeCard({super.key, required this.titleCard, required this.bodyCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 180,
            decoration: BoxDecoration(
              color: AppColor.primarycolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(
                titleCard,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                bodyCard,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -35,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
