import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/class/statusRequest.dart';
import '../core/constant/approutes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/address_data.dart';
import '../data/datasorce/remote/orders/checkout_data.dart';
import '../data/model/address.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? delivaryType;
  String addressId = "0";

  late String couponID;
  late String couponDiscount;
  late String priceorder;

  List<AddressModel> dataAddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDelivaryType(String val) {
    delivaryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  getAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.view(
        userId: myServices.sharedPreferences.getString("id")!);
    debugPrint('==================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressId = dataAddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a Payment method");
    }
    if (delivaryType == null) {
      return Get.snackbar("Error", "Please select a Delivary Type");
    }

    if (addressId == "0" && delivaryType == "0") {
      return Get.snackbar("Error", "Please select Address");
    }

    if (dataAddress.isEmpty) {
      return Get.snackbar("Error", "Please select Shipping Address");
    }

    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressId.toString(),
      "orderstype": delivaryType.toString(),
      "pricedelivary": "100",
      "ordersprice": priceorder,
      "couponid": couponID,
      "coupondiscount": couponDiscount,
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data: data);
    debugPrint('==================== Checkout Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "The Order Was Successfully");
        // print("success");
        // List listData = response['data'];
        // dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponID = Get.arguments['couponid'];
    couponDiscount = Get.arguments['coupondiscount'].toString();
    priceorder = Get.arguments['priceorder'];
    getAddress();
    super.onInit();
  }
}
