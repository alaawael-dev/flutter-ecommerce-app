import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsTable extends StatelessWidget {
  final String item;
  final String qty;
  final String price;
  final bool isActive;
  const OrderDetailsTable({
    super.key,
    required this.item,
    required this.qty,
    required this.price, required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Text(
              item,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive == true ? AppColor.secondColor : null,
                fontWeight: isActive == true ? FontWeight.bold: null,
              ),
            ),
            Text(
              qty,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive == true ? AppColor.secondColor : null,
                fontWeight: isActive == true ? FontWeight.bold: null,
              ),
            ),
            Text(
              price,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isActive == true ? AppColor.secondColor : null,
                fontWeight: isActive == true ? FontWeight.bold: null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
