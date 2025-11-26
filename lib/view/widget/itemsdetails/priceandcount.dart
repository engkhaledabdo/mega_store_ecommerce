import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class PriceAndCount extends StatelessWidget {
  const PriceAndCount({
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
    super.key,
  });
  final void Function() onAdd;
  final void Function() onRemove;
  final String price;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              padding: const EdgeInsets.only(bottom: 2),
              width: 50,
              alignment: Alignment.topCenter,
              decoration:
                  BoxDecoration(border: Border.all(color: AppColor.black)),
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          price,
          style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1.1),
        ),
      ],
    );
  }
}
