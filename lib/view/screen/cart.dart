import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: const Center(child: Text('Hello World')),
    );
  }
}
