import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Text(
        title,
        style: const TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }
}
