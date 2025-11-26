import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/notification_data.dart';
import '../data/model/notification_model.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List<NotificationModel> dataNotification = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  getNotification() async {
    dataNotification.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.getData(
        usersid: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Notification Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        dataNotification
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshNotification() async {
    dataNotification.clear();
    await getNotification();
  }

  @override
  void onInit() async {
    await getNotification();
    refreshNotification();
    super.onInit();
  }
}
