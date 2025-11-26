import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusRequest.dart';
import '../../../core/constant/approutes.dart';
import '../../../core/functions/handlingdata.dart';
import '../../../data/datasorce/remote/forgetpassword/verifycodeforgetpassworddata.dart';

abstract class ForgetPasswordVerifyCodeCotroller extends GetxController {
  verfyCode();
  goToResetPassword({required String verificationCode});
}

class ForgetPasswordVerifyCodeCotrollerImp
    extends ForgetPasswordVerifyCodeCotroller {
  StatusRequest? statusRequest = StatusRequest.none;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());

  late String email;

  @override
  verfyCode() {}

  @override
  goToResetPassword({required String verificationCode}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postData(
      email: email,
      verifycode: verificationCode,
    );

    debugPrint(
        '==================== Forget Password Verify Code Cotroller Controller : $response  ===================');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      statusRequest = StatusRequest.loading;
      update();
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.toNamed(AppRoute.resetPassword, arguments: {
          'email': email,
        });
      } else {
        Get.defaultDialog(
            title: "Worrning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
