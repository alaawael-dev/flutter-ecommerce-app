import 'package:ecommerce/controller/orders/archived_order_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/view/widget/orders/archived_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ArchivedOrderController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Archived Orders'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(14),
        child: GetBuilder<ArchivedOrderController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  ArchivedOrdersCard(orderList: controller.data[index]),
            ),
          ),
        ),
      ),
    );
  }
}
