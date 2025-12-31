import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PendingController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Orders'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(14),
        child: GetBuilder<PendingController>(
          builder: (controller) => ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) =>
                OrdersCard(orderList: controller.data[index]),
          ),
        ),
      ),
    );
  }
}

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
            Text(
              "Order Number: ${orderList.ordersId}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text("Order type:${controller.printOrderType(orderList.ordersType)}"),
            Text("Order price:  ${orderList.ordersPrice}"),
            Text("Delivery price:  ${orderList.ordersShippingprice}"),
            Text("Payment Method:  ${controller.printPaymentMethod(orderList.ordersPaymentmethod)}"),
            Divider(),
            Row(
              children: [
                Text(
                  "Total price:  ${orderList.ordersTotalprice}\$",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarycolor,
                  ),
                ),
                Spacer(),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  onPressed: () {},
                  color: AppColor.primarycolor,
                  child: Text(
                    "More details",
                    style: TextStyle(color: Colors.white),
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
