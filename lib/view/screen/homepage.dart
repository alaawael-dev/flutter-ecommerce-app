import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/view/widget/home/custom_categories_bar.dart';
import 'package:ecommerce/view/widget/home/custom_home_card.dart';
import 'package:ecommerce/view/widget/home/custom_home_title.dart';
import 'package:ecommerce/view/widget/home/custom_item_list.dart';
import 'package:ecommerce/view/widget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomSearchBar(
              searchTitle: "Find your product",
              onPressedSearch: () {},
              onPressedFavorite: () {
                Get.toNamed(AppRoute.favorite);
              },
            ),
            CustomHomeCard(titleCard: "Black friday", bodyCard: "20% OFF ALL "),
            CustomHomeTitle(title: "Categories"),
            CustomCategoriesBar(),
            CustomHomeTitle(title: "Products for you"),
            CustomItemList(),
          ],
        ),
      ),
    );
  }
}
