import 'package:flutter/material.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Orders'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}