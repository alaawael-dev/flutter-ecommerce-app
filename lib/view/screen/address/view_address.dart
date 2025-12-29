import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/view/widget/custom_address_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/consts/routes.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addAddress);
        },
        backgroundColor: AppColor.primarycolor,
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(title: const Text('Address'), centerTitle: true),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, i) {
                  return AddressCard(
                    addressModel: controller.data[i],
                    onDelete: () {
                      controller.deleteAddress(
                        controller.data[i].addressId.toString(),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
