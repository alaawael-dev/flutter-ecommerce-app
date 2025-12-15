import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomSignUpOrLogIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final Function()? onTap;
  const CustomSignUpOrLogIn({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: TextStyle(
              color: AppColor.primarycolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
