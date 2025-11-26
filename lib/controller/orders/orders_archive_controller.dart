import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasorce/remote/orders/order_archive_data.dart';
import '../../data/model/orders_model.dart';

class OrdersArchiveController extends GetxController {
  late StatusRequest statusRequest = StatusRequest.none;
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  MyServices myServices = Get.find();
  List<OrdersModel> dataOrders = [];

  Future<void> onRefreshPage() async {
    await refreshOrder();
    return await Future.delayed(const Duration(seconds: 2));
  }

  printOrderType(String val) {
    if (val == "0") {
      return "Delivary";
    } else {
      return "Store";
    }
  }

  printPaymenyMethod(String val) {
    if (val == "0") {
      return "Cash On Delivary";
    } else {
      return "Payment Card";
    }
  }

  printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order Is Being Prepared";
    } else if (val == "2") {
      return "Delivary Man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    dataOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData(
        usersID: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Orders Pending Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        dataOrders.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  submitRating(String ordersId, double rating, String comment) async {
    dataOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.rating(
        ordersID: ordersId, comment: comment, rating: rating.toString());
    debugPrint('==================== Orders Pending Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("succses");
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() async {
    dataOrders.clear();
    await getOrders();
  }

  @override
  void onInit() async {
    await getOrders();
    refreshOrder();
    super.onInit();
  }
}
