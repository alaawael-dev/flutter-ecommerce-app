import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/view/widget/custom_search_bar.dart';
import 'package:ecommerce/view/widget/items/custom_categories_items.dart';
import 'package:ecommerce/view/widget/items/custom_items_grid.dart';
import 'package:ecommerce/view/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});
  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(toolbarHeight: 30),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomSearchBar(
              myController: controller.search!,
              onChange: (val) {
                controller.checkSearch(val);
              },
              searchTitle: "Find your product",
              onPressedSearch: () {
                controller.onSearch();
              },
              onPressedFavorite: () {
                Get.toNamed(AppRoute.favorite);
              },
            ),
            SizedBox(height: 15),
            CustomCategoriesItems(),
            SizedBox(height: 20),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearching
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          controllerFav.favorite[controller
                                  .data[index]["items_id"]] =
                              controller.data[index]["favorite"];
                          return CustomItemsView(
                            itemModel: ItemModel.fromJson(
                              controller.data[index],
                            ),
                          );
                        },
                      )
                    : SearchList(searchModel: controller.listData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
