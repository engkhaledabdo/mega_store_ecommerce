import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomButtonAppBar extends StatelessWidget {
  const CustomButtonAppBar(
      {super.key,
      required this.textButton,
      required this.icon,
      this.onPressed,
      required this.active});
  final String textButton;
  final IconData icon;
  final void Function()? onPressed;
  final bool? active;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: active == true ? AppColor.primaryColor : AppColor.gray),
          // Text(
          //   textButton,
          //   style: TextStyle(
          //       color: active == true ? AppColor.primaryColor : AppColor.gray),
          // ),
        ],
      ),
    );
  }
}
