import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productdetails_controller.dart';
import '../../../core/constant/colors.dart';

class SubItemList extends GetView<ProductDetailsImp> {
  const SubItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: controller.subItems[index]["active"] == "1"
                    ? AppColor.forthColor
                    : Colors.white,
                border: Border.all(color: AppColor.forthColor),
                borderRadius: BorderRadius.circular(10)),
            width: 90,
            height: 60,
            child: Text(
              controller.subItems[index]["name"],
              style: TextStyle(
                  color: controller.subItems[index]["active"] == "1"
                      ? Colors.white
                      : AppColor.forthColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
