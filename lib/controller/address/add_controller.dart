import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasorce/remote/address_data.dart';

class AddAdressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  String? lat;
  String? long;

  add() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.add(
        userId: myServices.sharedPreferences.getString("id")!,
        name: name.text,
        city: city.text,
        street: street.text,
        lat: lat!,
        long: long!);
    debugPrint('==================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "Now , You Can Order To This address");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  @override
  void onInit() {
    initialData();
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }
}
