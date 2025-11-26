import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/approutes.dart';
import '../view/screen/home.dart';
import '../view/screen/notification.dart';
import '../view/screen/offers.dart';
import '../view/screen/orders/orders_layout.dart';
import '../view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listPage = [
    const HomePage(),
    const OffersView(),
    const Orders(),
    const Settings()
  ];

  List bottomAppBar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "notification", "icon": Icons.local_offer},
    // {"title": "Profile", "icon": Icons.person_pin_sharp},
    {"title": "Orders", "icon": Icons.card_travel},
    {"title": "Settings", "icon": Icons.settings},
  ];

  int currentPage = 0;
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
  }
}
