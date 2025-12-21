import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomPriceAmount extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onRemove;
  final String amount;
  final String price;
  const CustomPriceAmount({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.amount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              width: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(amount),
            ),
            IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(color: AppColor.primarycolor, fontSize: 20),
        ),
      ],
    );
  }
}
