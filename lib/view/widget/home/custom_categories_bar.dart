import 'package:ecommerce/api_link.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomCategoriesBar extends GetView<HomeControllerImp> {
  const CustomCategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoryModel: CategoryModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoryModel categoryModel;
  final int i;
  const Categories({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsPage(
          controller.categories,
          i,
          categoryModel.categoriesId.toString(),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColor.secondColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.network(
              "${AppLink.categories}/${categoryModel.categoriesImage}",
              color: AppColor.primarycolor,
            ),
          ),
          Text(
            categoryModel.categoriesName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primarycolor,
            ),
          ),
        ],
      ),
    );
  }
}
