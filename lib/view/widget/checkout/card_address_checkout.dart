import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CardAdressCheckout extends StatelessWidget {
  const CardAdressCheckout(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isactive,
      required this.onTap});
  final String title;
  final String subTitle;
  final bool isactive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isactive ? AppColor.primaryColor : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: isactive ? Colors.white : null,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subTitle,
              style: TextStyle(color: isactive ? Colors.white : null)),
        ),
      ),
    );
  }
}
