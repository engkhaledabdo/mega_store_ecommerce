import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CheckoutTitle extends StatelessWidget {
  const CheckoutTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: const TextStyle(
            color: AppColor.secoundColor,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
