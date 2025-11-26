import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasorce/remote/testapi_data.dart';
import '../data/model/testapi_model.dart';
import 'package:http/http.dart' as http;

import '../linkapi.dart';

class TestApiController extends GetxController {
  TestAPiData testData = TestAPiData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getApiData() async {
    var url = AppLink.testapi;
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    data.addAll(responsebody);
    update();
  }

  @override
  void onInit() {
    // getData();
    getApiData();
    super.onInit();
  }
}
