import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/offers_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/view/widget/custom_search_bar.dart';
import 'package:ecommerce/view/widget/offers/offers_card.dart';
import 'package:ecommerce/view/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());

    return Scaffold(
      body: GetBuilder<OffersController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
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
                SizedBox(height: 10),
                !controller.isSearching ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      OffersCard(itemModel: controller.data[index]),
                ) : SearchList(searchModel: controller.listData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
