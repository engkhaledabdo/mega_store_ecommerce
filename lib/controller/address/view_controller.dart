import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasorce/remote/address_data.dart';
import '../../data/model/address.dart';

class ViewAdressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> data = [];

  view() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.view(
      userId: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint('==================== Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete({required String addressID}) {
    addressData.delete(addressId: addressID);
    data.removeWhere((element) => element.addressId == addressID);
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
