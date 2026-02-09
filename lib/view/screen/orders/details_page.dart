import 'package:ecommerce/controller/orders/order_details_controller.dart';
import 'package:ecommerce/view/widget/orders/custom_order_details_price.dart';
import 'package:ecommerce/view/widget/orders/order_details_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details'), centerTitle: true),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 10),
        child: GetBuilder<OrderDetailsController>(
          builder: (controller) {
            return ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        OrderDetailsTable(
                          item: "Items",
                          qty: "Quantity",
                          price: "Price",
                          isActive: true,
                        ),
                        ...List.generate(
                          controller.data.length,
                          (index) => OrderDetailsTable(
                            item: "${controller.data[index].itemsName}",
                            qty: "${controller.data[index].itemsQuantity}",
                            price: "${controller.data[index].itemsPrice}",
                            isActive: false,
                          ),
                        ),
                        CustomOrderDetailsPrice(
                          price: "${controller.orderModel.ordersTotalPrice} ",
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.orderModel.ordersType == 0)
                  Card(
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "${controller.orderModel.addressStreet!} ${controller.orderModel.addressCity!} ",
                        ),
                        subtitle: Text(controller.orderModel.addressType!),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
