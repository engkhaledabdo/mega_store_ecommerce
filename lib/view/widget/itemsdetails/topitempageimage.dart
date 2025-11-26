import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/productdetails_controller.dart';
import '../../../linkapi.dart';

class TopItemDetailsPageImage extends GetView<ProductDetailsImp> {
  const TopItemDetailsPageImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
                // color: AppColor.secoundColor,
                ),
          ),
          Positioned(
            top: 30,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: Get.width / 1.5,
                    height: Get.width / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(120)),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: controller.itemsModel.itemsId!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
                      height: Get.width / 1.6,
                      width: Get.width / 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
