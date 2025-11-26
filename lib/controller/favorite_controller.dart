import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/class/statusRequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/favorite_dara.dart';
import 'search_controller.dart';

class FavoriteController extends SearchMixController {
  FavoriteData favoriteDAta = FavoriteData(Get.find());
  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};

  // key => id items
  // value => 1 or 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite({required String itemsId}) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteDAta.addFavorite(
      usersId: myServices.sharedPreferences.getString("id")!,
      itemsId: itemsId,
    );
    debugPrint('==================== favorite Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافه المنتج الى المفضله"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite({required String itemsId}) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteDAta.deleteFavorite(
        usersId: myServices.sharedPreferences.getString("id")!,
        itemsId: itemsId);
    debugPrint('==================== favorite Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضله"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
