import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSubItem extends GetView<ProductDetailsControllerImp> {
  const CustomSubItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            margin: EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            // padding: EdgeInsets.all(10),
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: controller.subItems[index]["active"] == "1"
                  ? AppColor.primarycolor
                  : Colors.white,
              border: BoxBorder.all(color: AppColor.primarycolor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              controller.subItems[index]["name"],
              style: controller.subItems[index]["active"] == "1"
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
