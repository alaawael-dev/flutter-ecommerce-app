import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/consts/imageassets.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsView extends GetView<ItemsControllerImp> {
  final ItemModel itemModel;
  const CustomItemsView({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Card(
          child: Stack(
            children: [
              Padding(
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
                          itemModel.itemsName,
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
                          "${itemModel.itemsAfterDiscount}\$",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.favorite[itemModel.itemsId] == 1) {
                                controller.changeFavorite(itemModel.itemsId, 0);
                                controller.removeData(
                                  itemModel.itemsId.toString(),
                                  itemModel.itemsName,
                                );
                              } else {
                                controller.changeFavorite(itemModel.itemsId, 1);
                                controller.addData(
                                  itemModel.itemsId.toString(),
                                  itemModel.itemsName,
                                );
                              }
                            },
                            icon: Icon(
                              controller.favorite[itemModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (itemModel.itemsDiscount != 0)
                Positioned(
                  top: 2,
                  left: 2,
                  child: Image.asset(AppImageAssets.sale, width: 45),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
