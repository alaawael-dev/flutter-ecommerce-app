import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/view/widget/orders/pending_orders_card.dart';
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
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  OrdersCard(orderList: controller.data[index]),
            ),
          ),
        ),
      ),
    );
  }
}

