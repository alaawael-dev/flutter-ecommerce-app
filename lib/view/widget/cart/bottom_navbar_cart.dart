import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/view/widget/custom_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarCart extends GetView<CartController> {
  final String price;
  final String coupon;
  final String shipping;
  final String total;
  final void Function() onCoupon;
  final TextEditingController coupController;
  const BottomNavbarCart({
    super.key,
    required this.price,
    required this.shipping,
    required this.total,
    required this.onCoupon,
    required this.coupController,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
          builder: (controller) => controller.coupName == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: coupController,
                          decoration: InputDecoration(
                            hint: Text(
                              "Add Your Coupon",
                              style: TextStyle(
                                color: AppColor.grey,
                                fontSize: 16,
                              ),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(4),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomBottomButton(
                          onPressed: onCoupon,
                          title: "Add",
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Text(
                    "Coupon code: ${controller.coupName}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondColor,
                      fontSize: 18,
                    ),
                  ),
                ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppColor.primarycolor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Price"), Text("$price\$")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Copoun"), Text("${coupon}%")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Shipping"), Text("$shipping\$")],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Total"), Text("$total\$")],
              ),
            ],
          ),
        ),
        CustomBottomButton(
          onPressed: () {
            controller.goToCheckout();
          },
          title: "Place Order",
        ),
      ],
    );
  }
}
