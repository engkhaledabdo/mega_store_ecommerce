import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  const CardPaymentMethodCheckout(
      {super.key, required this.title, required this.isActive});
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive ? AppColor.primaryColor : AppColor.thirdColor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : AppColor.secoundColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }
}
