import 'package:ecommerce/view/widget/custom_bottom_button.dart';
import 'package:flutter/material.dart';

class BottomNavCart extends StatelessWidget {
  final String price;
  final String ship;
  final String total;
  const BottomNavCart({super.key, required this.price, required this.ship, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("Price"), Text(price)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("Shipping"), Text(ship)],
        ),
        Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("Total price"), Text(total)],
        ),
        SizedBox(height: 8),
        CustomBottomButton(title: "Proceed to Checkout", onPressed: () {}),
      ],
    );
  }
}
