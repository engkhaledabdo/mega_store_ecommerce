import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/favorite_controller.dart';

import '../../../controller/homepage_controller.dart';
import 'custom_card_list_home.dart';

class ListItemsDiscountHome extends GetView<HomePageControllerImp> {
  const ListItemsDiscountHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return SizedBox(
      height: 290,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.3),
        itemCount: controller.discount.length,
        itemBuilder: (context, i) {
          return InkWell(
              onTap: () {
                controller.goToPageItemsDetails(controller.discount[i]);
              },
              child: CustomCardListHome(
                itemsModel: controller.discount[i],
              ));
        },
      ),
    );
  }
}
