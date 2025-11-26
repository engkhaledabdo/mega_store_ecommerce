import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller.dart';
import '../../../controller/homepage_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/transletedb.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class CustomCardListHome extends GetView<HomePageControllerImp> {
  const CustomCardListHome({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageItemsDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage!}",
                    fit: BoxFit.cover,
                    height: 105,
                  ),
                  Text(
                    translateDataBase(
                        itemsModel.itemsName, itemsModel.itemsNameAr),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    translateDataBase(
                        itemsModel.itemsDesc!, itemsModel.itemsDescAr!),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPriceDiscount}\$",
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "sans",
                        ),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.removeFavorite(
                                  itemsId: itemsModel.itemsId.toString()!);
                            } else {
                              controller.setFavorite(itemsModel.itemsId, "1");
                              controller.addFavorite(
                                  itemsId: itemsModel.itemsId.toString()!);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != '0')
              Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(AppImageAsset.discount, width: 40))
          ],
        ),
      ),
    );
  }
}
