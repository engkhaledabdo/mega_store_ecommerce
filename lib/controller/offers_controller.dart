import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasorce/remote/offers_data.dart';
import '../data/model/itemsmodel.dart';
import 'search_controller.dart';

class OffersController extends SearchMixController {
  OfferData offerData = OfferData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  Future<void> onRefreshPage() async {
    await refreshPage();
    // return await Future.delayed(const Duration(seconds: 2));
  }

  refreshPage() async {
    data.clear();
    await getData();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offerData.getData();
    debugPrint('==================== Offers Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
