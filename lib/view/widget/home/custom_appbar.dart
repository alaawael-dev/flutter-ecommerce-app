import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String pageName;
  final bool active;
  const CustomAppBar({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.pageName,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primarycolor : AppColor.grey,
          ),
          Text(
            pageName,
            style: TextStyle(
              color: active == true ? AppColor.primarycolor : AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
