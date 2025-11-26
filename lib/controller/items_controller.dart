import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/class/statusRequest.dart';
import '../core/constant/approutes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/items_data.dart';
import '../data/model/itemsmodel.dart';
import 'search_controller.dart';

abstract class ItemsController extends SearchMixController {
  initalData();
  changeCat(int val, String catVal);
  getItems({required String categoriesId});
  goToPageItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  String? catId;

  ItemsData itemsData = ItemsData(Get.find());
  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  initalData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    catId = Get.arguments["categoriesId"];
    getItems(categoriesId: catId!);
  }

  @override
  void onInit() {
    search = TextEditingController();
    initalData();
    super.onInit();
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(categoriesId: catId!);
    update();
  }

  @override
  getItems({required String categoriesId}) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      categoriesId: categoriesId,
      usersId: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint('==================== Items Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageItemsDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }
}
