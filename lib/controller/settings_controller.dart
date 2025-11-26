import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/class/statusRequest.dart';
import '../core/constant/approutes.dart';
import '../core/functions/fcmconfig.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/setting_data.dart';
import '../data/model/users_model.dart';
import 'search_controller.dart';

abstract class SettingsController extends SearchMixController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  bool notifications = true;

  SettingsData testData = SettingsData(Get.find());
  List<UsersModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  late String username;
  late String email;

  @override
  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  changeNotifications(val) {
    String userid = myServices.sharedPreferences.getString("id")!;
    if (notifications = true) {
      notifications = val;
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
      print("unsub");
      update();
    } else {
      requestPermissionNotifacation();
      fcmconfig();
      notifications = val;
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users${userid}");
      print("sub");
      update();
    }
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData(
        usersid: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Settings Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => UsersModel.fromJson(e)));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getUserData() {
    username = myServices.sharedPreferences.getString("username")!;
    email = myServices.sharedPreferences.getString("email")!;
  }

  @override
  void onInit() {
    search = TextEditingController();
    username = myServices.sharedPreferences.getString("username")!;
    email = myServices.sharedPreferences.getString("email")!;
    getData();
    super.onInit();
  }

  // void toggleSwitch() {
  //   notifications.value = !notifications.value;
  // }
}
