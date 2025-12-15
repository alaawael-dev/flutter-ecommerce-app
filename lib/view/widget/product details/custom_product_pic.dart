import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductPicture extends GetView<ProductDetailsControllerImp> {
  const CustomProductPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            color: AppColor.primarycolor,
          ),
        ),
        Positioned(
          top: 70,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItems}/${controller.itemModel.itemsImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
