import 'package:ecommerce/controller/view_favorite_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/view/widget/custom_search_bar.dart';
import 'package:ecommerce/view/widget/myfavorite/custom_favorite_grid.dart';
import 'package:ecommerce/view/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritePageControllerImp controller = Get.put(FavoritePageControllerImp());
    return Scaffold(
      appBar: AppBar(toolbarHeight: 30),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
            GetBuilder<FavoritePageControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearching
                    ? GridView.builder(
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) =>
                            CustomFavoriteItemsView(
                              itemModel: controller.data[index],
                            ),
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
