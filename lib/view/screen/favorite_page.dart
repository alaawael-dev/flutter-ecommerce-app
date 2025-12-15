import 'package:ecommerce/controller/view_favorite_controller.dart';
import 'package:ecommerce/view/widget/custom_search_bar.dart';
import 'package:ecommerce/view/widget/myfavorite/custom_favorite_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritePageController());
    return Scaffold(
      appBar: AppBar(toolbarHeight: 30),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CustomSearchBar(
              searchTitle: "Find your product",
              onPressedSearch: () {},
              onPressedFavorite: () {
                Get.toNamed("favorite");
              },
            ),
            SizedBox(height: 15),
            GetBuilder<FavoritePageController>(
              builder: (controller) => GridView.builder(
                itemCount: controller.data.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) =>
                    CustomFavoriteItemsView(itemModel: controller.data[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
