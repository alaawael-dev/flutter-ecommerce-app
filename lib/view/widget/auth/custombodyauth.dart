import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  final String body;
  const CustomBodyAuth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );
  }
}
