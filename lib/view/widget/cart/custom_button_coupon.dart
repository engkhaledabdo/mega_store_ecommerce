import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomButtonCoupon extends StatelessWidget {
  const CustomButtonCoupon(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 5),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.primaryColor,
      ),
      child: MaterialButton(
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
