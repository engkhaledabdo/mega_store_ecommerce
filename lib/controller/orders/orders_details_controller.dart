import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasorce/remote/orders/details_data.dart';
import '../../data/model/cart.dart';
import '../../data/model/orders_model.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    if (ordersModel.ordersType == "0") {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await ordersDetailsData.getData(cartOrdersID: ordersModel.ordersId!);
      debugPrint('==================== Orders Details Controller $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          List listData = response['data'];
          data.addAll(listData.map((e) => CartModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['dataorders'];
    getData();
    super.onInit();
  }
}
