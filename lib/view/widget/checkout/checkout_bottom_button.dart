import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CheckoutBottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const CheckoutBottomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        color: AppColor.secondColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
