import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/myfavorite_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/transletedb.dart';
import '../../../data/model/myfavorite.dart';
import '../../../linkapi.dart';

class CustomListFavoriteItems extends GetView<MYFavoriteController> {
  const CustomListFavoriteItems({
    super.key,
    required this.myFavoriteModel,
  });
  final MyFavoriteModel myFavoriteModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToPageItemsDetails(myFavoriteModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: myFavoriteModel.itemsId!,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imageItems}/${myFavoriteModel.itemsImage!}",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Text(
                translateDataBase(
                    myFavoriteModel.itemsName, myFavoriteModel.itemsNameAr),
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: const TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              // Text(
              //   translateDataBase(
              //       myFavoriteModel.itemsDesc!, myFavoriteModel.itemsDescAr!),
              //   overflow: TextOverflow.clip,
              //   maxLines: 2,
              //   textAlign: TextAlign.center,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rating 3.5", textAlign: TextAlign.center),
                  Container(
                    // alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                size: 15,
                              ))
                    ]),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${myFavoriteModel.itemsPrice!}\$",
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "sans",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteMyFavorite(
                          favoriteId: myFavoriteModel.favoriteId.toString());
                    },
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: AppColor.primaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
