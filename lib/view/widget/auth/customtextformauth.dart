import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String label;
  final IconData iconData;
  final TextEditingController? mycontroller;
  const CustomTextFormAuth({
    super.key,
    required this.hinttext,
    required this.label,
    required this.iconData,
    this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: TextFormField(
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
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
