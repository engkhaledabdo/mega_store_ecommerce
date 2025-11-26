import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CardDelivaryTypeCheckout extends StatelessWidget {
  const CardDelivaryTypeCheckout(
      {super.key,
      required this.title,
      required this.active,
      required this.imageUrl,
      required this.onTap});
  final String title;
  final bool active;
  final String imageUrl;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.secoundColor),
            borderRadius: BorderRadius.circular(10),
            color: active ? AppColor.primaryColor.withOpacity(0.9) : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl, width: 80),
            Text(
              title,
              style: TextStyle(
                  color: active ? Colors.white : AppColor.primaryColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
