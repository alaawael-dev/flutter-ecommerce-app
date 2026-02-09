import 'package:flutter/material.dart';

class CustomOrderDetailsPrice extends StatelessWidget {
  final String price;
  const CustomOrderDetailsPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Total Price: $price\$",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
