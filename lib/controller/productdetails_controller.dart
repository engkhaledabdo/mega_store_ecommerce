import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/constant/approutes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/cart_data.dart';
import '../data/model/itemsmodel.dart';

abstract class ProductDetails extends GetxController {}

class ProductDetailsImp extends ProductDetails {
  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  // CartControllerImp cartController = Get.put(CartControllerImp());

  int countitems = 0;

  List subItems = [
    {"name": "Silver", "id": 1, "active": "1"},
    {"name": "Black", "id": 2, "active": "0"},
  ];
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  addCart({required String itemsId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
      usersId: myServices.sharedPreferences.getString("id")!,
      itemsId: itemsId,
    );
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافه المنتج الى السلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCart({required String itemsId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
      usersId: myServices.sharedPreferences.getString("id")!,
      itemsId: itemsId,
    );
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازاله المنتج من السلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems({required String itemsId}) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountItems(
      usersId: myServices.sharedPreferences.getString("id")!,
      itemsId: itemsId,
    );
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response["data"].toString());
        // String countitems ;
        // countitems = response["data"];
        debugPrint("============================");
        debugPrint("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initalData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsId: itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  addItems() {
    addCart(itemsId: itemsModel.itemsId.toString()!);
    countitems++;
    update();
  }

  removeItems() {
    if (countitems > 0) {
      deleteCart(itemsId: itemsModel.itemsId.toString()!);
      countitems--;
      update();
    }
  }

  goToCart() {
    Get.toNamed(AppRoute.cart);
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
