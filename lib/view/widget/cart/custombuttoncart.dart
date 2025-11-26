import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.primaryColor,
      ),
      child: MaterialButton(
        textColor: Colors.white,
        // color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
