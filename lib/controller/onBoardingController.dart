// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/approutes.dart';
import '../core/services/services.dart';
import '../data/datasorce/static/static.dart';

abstract class OnBoradingController extends GetxController {
  nextPage();
  onPageChanged(int index);
}

class OnBoradingControllerImp extends OnBoradingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  MyServices myServices = Get.find();
  @override
  nextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
