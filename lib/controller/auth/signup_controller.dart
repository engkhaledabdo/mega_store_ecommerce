import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/class/statusRequest.dart';
import '../../core/constant/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasorce/remote/auth/signupdata.dart';

abstract class SignUpCotroller extends GetxController {
  signUp();
  goToLogin();
}

class SignUpCotrollerImp extends SignUpCotroller {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late GlobalKey<FormState> key;

  StatusRequest? statusRequest = StatusRequest.none;

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  
  signUp() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signUpData.postData(
        username: username.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        phone: phone.text.trim(),
      );

      debugPrint(
          '==================== SignUp Controller : $response  ===================');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        statusRequest = StatusRequest.loading;
        update();
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.signUpVerifyCode, arguments: {
            "email": email.text.trim(),
          });
        } else {
          Get.defaultDialog(
              title: "Worrning",
              middleText: "Email Or PhoneNumber Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();

      // Get.delete<SignUpCotrollerImp>();
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    key = GlobalKey<FormState>();
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
