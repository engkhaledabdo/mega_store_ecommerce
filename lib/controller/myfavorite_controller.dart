import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/myfavorite_data.dart';
import '../data/model/myfavorite.dart';
import 'search_controller.dart';

class MYFavoriteController extends SearchMixController {
  MyFavoriteDate myFavoriteData = MyFavoriteDate(Get.find());

  List<MyFavoriteModel> data = [];

  @override
  late StatusRequest statusRequest;

  @override
  MyServices myServices = Get.find();

  Map isFavorite = {};

  // key => id items
  // value => 1 or 0

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(
      usersId: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint('==================== MyFavorite Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print(" ========= data ========");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteMyFavorite({required String favoriteId}) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = myFavoriteData.deleteData(favId: favoriteId);
    debugPrint('==================== MyFavorite Controller $response');
    data.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
