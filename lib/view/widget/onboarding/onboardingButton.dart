// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/onBoardingController.dart';
import '../../../core/constant/colors.dart';

class OnboardingButton extends GetView<OnBoradingControllerImp> {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        textColor: Colors.white,
        onPressed: () {
          controller.nextPage();
        },
        child: Text(
          "8".tr,
        ),
      ),
    );
  }
}
