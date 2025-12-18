import 'package:ecommerce/view/widget/cart/bottom_navbar_cart.dart';
import 'package:ecommerce/view/widget/cart/cart_product_cart.dart';
import 'package:ecommerce/view/widget/cart/top_total_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      bottomNavigationBar: BottomNavbarCart(
        price: "600",
        shipping: "600",
        total: "600",
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          TopTotalItems(count: "2"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CartProductCart(title: "Macbook Pro", price: "600", count: "2"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
