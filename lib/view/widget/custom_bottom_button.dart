import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const CustomBottomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: MaterialButton(
        color: AppColor.primarycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
