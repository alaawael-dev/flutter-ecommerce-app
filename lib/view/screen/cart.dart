import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/view/widget/cart/bottom_navbar_cart.dart';
import 'package:ecommerce/view/widget/cart/cart_product_cart.dart';
import 'package:ecommerce/view/widget/cart/top_total_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => BottomNavbarCart(
          price: "${controller.priceOrders}",
          shipping: "600",
          total: "600",
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.data.isEmpty) {
            return Center(child: Text("Your cart is empty"));
          }
          return ListView(
            children: [
              SizedBox(height: 10),
              TopTotalItems(count: "${controller.totalCountItems}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ...List.generate(
                      controller.data.length,
                      (index) => CartProductCart(
                        imageName: "${controller.data[index].itemsImage}",
                        title: "${controller.data[index].itemsName}",
                        price: "${controller.data[index].itemsPrice}",
                        count: "${controller.data[index].itemscount}",
                        onAdd: () async {
                          await controller.addData(
                            controller.data[index].itemsId.toString(),
                            itemName: controller.data[index].itemsName,
                          );
                          controller.refreshPage();
                        },
                        onRemove: () async {
                          await controller.deleteData(
                            controller.data[index].itemsId.toString(),
                            itemName: controller.data[index].itemsName,
                          );
                          controller.refreshPage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
