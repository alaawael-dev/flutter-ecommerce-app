import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemList extends GetView<HomeControllerImp> {
  const CustomItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Items(itemModel: ItemModel.fromJson(controller.items[index]));
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemModel itemModel;
  const Items({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.imageItems}/${itemModel.itemsImage}",
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.primarycolor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
