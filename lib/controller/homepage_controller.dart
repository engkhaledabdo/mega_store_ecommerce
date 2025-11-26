import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/constant/approutes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/homedata.dart';
import '../data/model/itemsmodel.dart';
import 'search_controller.dart';

abstract class HomePageController extends SearchMixController {
  inatialData();
  getData();
  goToItems(
      {required List categories,
      required int selectedCat,
      required String categoriesId});
  // searchData();
  goToPageItemsDetails(ItemsModel itemsModel);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();

  // List<ItemsModel> listdata = [];

  String? username;
  String? userID;
  String? lang;

  // TextEditingController? search;
  // bool isSearch = false;

  HomeData homeData = HomeData(Get.find());
  List<ItemsModel> topseling = [];
  List categories = [];
  List settings = [];
  List<ItemsModel> discount = [];

  List<ItemsModel> itemsdataModel = [];

  // late StatusRequest statusRequest;

  // checkSearch(val) {
  //   if (val == "") {
  //     isSearch = false;
  //   }
  //   update();
  // }

  // onSearchItems() {
  //   isSearch = true;
  //   searchData();
  //   update();
  // }

  Future<void> onRefreshPage() async {
    await refreshPage();
    update();
    // return await Future.delayed(const Duration(seconds: 2));
  }

  refreshPage() async {
    categories.clear();
    topseling.clear();
    settings.clear();
    discount.clear();
    await getData();
  }

  @override
  inatialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    userID = myServices.sharedPreferences.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    debugPrint('==================== Home Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);

        List responseItemsdata = response['items']['data'];
        topseling.addAll(responseItemsdata.map((e) => ItemsModel.fromJson(e)));

        settings.addAll(response['settings']['data']);

        // to do
        // List responsedata = response['items']['data'];
        // itemsdataModel.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));

        List responseDiscountdata = response['discount']['data'];
        discount
            .addAll(responseDiscountdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(
      {required List categories,
      required int selectedCat,
      required String categoriesId}) {
    Get.toNamed(
      AppRoute.items,
      arguments: {
        "categories": categories,
        "selectedCat": selectedCat,
        "categoriesId": categoriesId,
      },
    );
  }

  @override
  void onInit() {
    search = TextEditingController();

    getData();
    inatialData();
    super.onInit();
  }

  // @override
  // searchData() async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await homeData.searchData(search: search!.text);
  //   debugPrint('==================== Home Controller $response');
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       listdata.clear();
  //       List responsedata = response['data'];
  //       listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  goToPageItemsDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }
}
