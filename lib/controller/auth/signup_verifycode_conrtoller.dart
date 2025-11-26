import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/approutes.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingdata.dart';

import '../../data/datasorce/remote/auth/signupverifycodedata.dart';

abstract class SignUpVerifyCodeCotroller extends GetxController {
  goToSuccessSignUp({required verificationCode});
  resend();
}

class SignUpVerifyCodeCotrollerImp extends SignUpVerifyCodeCotroller {
  late String email;

  StatusRequest? statusRequest = StatusRequest.none;

  SignUpVerifyCodeData signUpData = SignUpVerifyCodeData(Get.find());
  List data = [];

  @override
  goToSuccessSignUp({required verificationCode}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postData(
      email: email,
      verifyCode: verificationCode,
    );

    debugPrint(
        '==================== SignUpVerifyCode Controller : $response  ===================');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      statusRequest = StatusRequest.loading;
      update();
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Worrning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    // Get.toNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  resend() {
    signUpData.resendData(
      email: email,
    );
  }
}
