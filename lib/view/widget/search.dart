import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchList extends GetView<HomeControllerImp> {
  final List<ItemModel> searchModel;
  const SearchList({super.key, required this.searchModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: searchModel.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              controller.goToProductDetails(searchModel[i]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${searchModel[i].itemsImage}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(searchModel[i].itemsName),
                        subtitle: Text(searchModel[i].categoriesName),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
