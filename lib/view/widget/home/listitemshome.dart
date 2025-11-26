import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/favorite_controller.dart';
import '../../../controller/homepage_controller.dart';
import '../../../core/constant/colors.dart';

import '../../../core/functions/transletedb.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';
import 'custom_card_list_home.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.put(FavoriteController());

    return SizedBox(
      height: 290,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.3),
        itemCount: controller.topseling.length,
        itemBuilder: (context, i) {
          controllerFav.isFavorite[controller.topseling[i].itemsId] =
              controller.topseling[i].favorite;
          return InkWell(
              onTap: () {
                // controller.goToPageItemsDetails(controller.topseling[i]);
              },
              child: CustomCardListHome(
                itemsModel: controller.topseling[i],
              ));
        },
      ),
    );
  }
}

class ItemsHome extends StatelessWidget {
  const ItemsHome({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CachedNetworkImage(
            imageUrl: '${AppLink.imageItems}/${itemsModel.itemsImage}',
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.black.withOpacity(0.3),
          ),
          height: 120,
          width: 200,
        ),
        Positioned(
            left: 10,
            child: Text(
              translateDataBase(itemsModel.itemsName, itemsModel.itemsNameAr),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ))
      ],
    );
  }
}
