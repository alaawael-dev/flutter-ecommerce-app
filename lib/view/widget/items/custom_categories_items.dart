import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColor.secondColor, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
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

class Categories extends GetView<ItemsControllerImp> {
  final CategoryModel categoryModel;
  final int i;
  const Categories({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i, categoryModel.categoriesId.toString());
      },
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                      color: AppColor.secondColor,
                      borderRadius: BorderRadius.circular(10),
                    )
                  : null,
              child: Text(
                categoryModel.categoriesName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: controller.selectedCat == i
                      ? Colors.white
                      : AppColor.secondColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
