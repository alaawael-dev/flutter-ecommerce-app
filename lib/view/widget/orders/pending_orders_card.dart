import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersCard extends GetView<PendingController> {
  final PendingOrderModel orderList;
  const OrdersCard({super.key, required this.orderList});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number: ${orderList.ordersId}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  Jiffy.parse(orderList.ordersDate).fromNow(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarycolor,
                  ),
                ),
              ],
            ),
            Divider(),
            Text(
              "Order type:${controller.printOrderType(orderList.ordersType)}",
            ),
            Text("Order price: ${orderList.ordersPrice}"),
            Text("Delivery price: ${orderList.ordersShippingPrice}"),
            Text(
              "Payment Method: ${controller.printPaymentMethod(orderList.ordersPaymentMethod)}",
            ),
            Text(
              "Order Status: ${controller.printOrderStatus(orderList.ordersStatus.toString())}",
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "Total price:  ${orderList.ordersTotalPrice}\$",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarycolor,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      onPressed: () {
                        Get.toNamed(
                          AppRoute.detailsPage,
                          arguments: {"ordersmodel": orderList},
                        );
                      },
                      color: AppColor.primarycolor,
                      child: Text(
                        "Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      onPressed: () {
                        controller.deleteOrder(orderList.ordersId.toString());
                      },
                      color: Colors.red,
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
