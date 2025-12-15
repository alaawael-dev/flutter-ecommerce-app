import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/view/widget/custom_bottom_button.dart';
import 'package:ecommerce/view/widget/product%20details/custom_price_amount.dart';
import 'package:ecommerce/view/widget/product%20details/custom_product_pic.dart';
import 'package:ecommerce/view/widget/product%20details/custom_subitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<ProductDetailsControllerImp>(
        init: ProductDetailsControllerImp(),
        builder: (controller) => CustomBottomButton(
          title: "Go to Cart",
          onPressed: () {
            controller.goToCart();
          },
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        init: ProductDetailsControllerImp(),
        builder: (controller) {
          return Container(
            child: ListView(
              children: [
                CustomProductPicture(),
                SizedBox(height: 100),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.itemModel.itemsName}",
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(color: AppColor.primarycolor),
                      ),
                      CustomPriceAmount(
                        onAdd: () {
                          controller.cartController.addCart(
                            controller.itemModel.itemsId.toString(),
                          );
                        },
                        onRemove: () {
                          controller.remove();
                        },
                        amount: "${controller.itemCount}",
                        price: "${controller.itemModel.itemsPrice}\$",
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${controller.itemModel.itemsDesc} ${controller.itemModel.itemsDesc} ${controller.itemModel.itemsDesc}",
                        style: TextStyle(color: AppColor.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Colors",
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(color: AppColor.primarycolor),
                      ),
                      SizedBox(height: 8),
                      CustomSubItem(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
