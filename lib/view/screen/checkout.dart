import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/core/consts/imageassets.dart';
import 'package:ecommerce/view/widget/checkout/checkout_bottom_button.dart';
import 'package:ecommerce/view/widget/checkout/checkout_delivery_method.dart';
import 'package:ecommerce/view/widget/checkout/checkout_location_card.dart';
import 'package:ecommerce/view/widget/checkout/checkout_payment_method.dart';
import 'package:ecommerce/view/widget/checkout/checkout_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CheckoutController>;
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
      bottomNavigationBar: CheckoutBottomButton(
        onPressed: () {},
        title: "Checkout",
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                CheckoutTitle(title: "Choose Payment Method"),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.choosePayment("cash");
                  },
                  child: CheckoutPaymentMethod(
                    method: "Cash",
                    isActive: controller.payment == "cash" ? true : false,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePayment("cards");
                  },
                  child: CheckoutPaymentMethod(
                    method: "Cards",
                    isActive: controller.payment == "cards" ? true : false,
                  ),
                ),
                SizedBox(height: 40),
                CheckoutTitle(title: "Choose Delivery Method"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDelivery("delivery");
                      },
                      child: CheckoutDeliveryMethod(
                        method: "Delivery",
                        image: AppImageAssets.delivery,
                        isActive: controller.delivery == "delivery"
                            ? true
                            : false,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.chooseDelivery("drive");
                      },
                      child: CheckoutDeliveryMethod(
                        method: "Drive Thru",
                        image: AppImageAssets.drive,
                        isActive: controller.delivery == "drive" ? true : false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                if (controller.delivery == "delivery")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckoutTitle(title: "Choose Delivery Location"),
                      SizedBox(height: 20),
                      ...List.generate(
                        controller.data.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseLocation(
                              controller.data[index].addressId.toString(),
                            );
                          },
                          child: CheckoutLocationCard(
                            title: controller.data[index].street,
                            subtitle: controller.data[index].city,
                            isActive:
                                int.parse(controller.locationId!) ==
                                    controller.data[index].addressId
                                ? true
                                : false,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
