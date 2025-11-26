import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomTopCardCart extends StatelessWidget {
  const CustomTopCardCart({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.secoundColor),
      ),
    );
  }
}
