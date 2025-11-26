import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/homedata.dart';
import '../data/model/itemsmodel.dart';

class SearchMixController extends GetxController {
  TextEditingController? search;
  bool isSearch = false;
  MyServices myServices = Get.find();
  List<ItemsModel> listdata = [];
  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search: search!.text);
    debugPrint('==================== Home Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
