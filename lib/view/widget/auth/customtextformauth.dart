import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;
  const CustomTextFormAuth({
    super.key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    this.keyboardType,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: mycontroller,
        keyboardType: keyboardType,
        validator: valid,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 15),
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 9),
            child: Text(label),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: InkWell(child: Icon(iconData), onTap: onTapIcon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
