import 'package:ecommerce/view/widget/custom_bottom_button.dart';
import 'package:flutter/material.dart';

class BottomNavbarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String total;
  const BottomNavbarCart({super.key, required this.price, required this.shipping, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Price"), Text("$price\$")],
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
          CustomBottomButton(onPressed: () {}, title: "Place Order"),
        ],
      ),
    );
  }
}
