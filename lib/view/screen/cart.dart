import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/view/widget/cart/bottom_nav_cart.dart';
import 'package:ecommerce/view/widget/cart/custom_cart_items.dart';
import 'package:ecommerce/view/widget/cart/custom_count_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  Cart({super.key});
  final CartControllerImp cartController = Get.find<CartControllerImp>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cartController.data.isEmpty) {
        cartController.forceFetchCart();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      bottomNavigationBar: BottomNavCart(
        price: "8",
        ship: "150\$",
        total: "600\$",
      ),
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => ListView(
          children: [
            CustomCountContainer(
              title:
                  "You have a total of ${controller.totalItems} items in your cart",
            ),
            Column(
              children: [
                ...List.generate(
                  controller.data.length,
                  (index) => CustomCartItems(
                    name: "${controller.data[index].itemsName}",
                    onAdd: () async {
                      controller.refresh();
                      await controller.addCart(
                        controller.data[index].itemsId!.toString(),
                      );
                    },
                    onRemove: () async {
                      controller.refresh();
                      await controller.deleteCart(
                        controller.data[index].itemsId!.toString(),
                      );
                    },
                    count: "${controller.data[index].itemscount}",
                    price: "${controller.data[index].itemsPrice}\$",
                    imageName: "${controller.data[index].itemsImage}",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
