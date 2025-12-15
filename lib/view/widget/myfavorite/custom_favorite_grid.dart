import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/controller/view_favorite_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/data/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFavoriteItemsView extends GetView<FavoritePageController> {
  final FavoriteModel itemModel;
  const CustomFavoriteItemsView({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${itemModel.itemsImage}",
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      itemModel.itemsName!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("3.5"),
                        Icon(
                          Icons.star,
                          color: AppColor.primarycolor,
                          size: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: AppColor.primarycolor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemModel.itemsPrice}\$",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GetBuilder<FavoritePageController>(
                      builder: (controller) => IconButton(
                        onPressed: () {
                          controller.delete(itemModel.favoriteId.toString());
                        },
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
