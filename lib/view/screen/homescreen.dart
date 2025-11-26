import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreen_controller.dart';
import '../../core/constant/colors.dart';
import '../../core/functions/alertexitapp.dart';
import '../widget/home/custombottomappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            controller.goToCart();
          },
          child: Icon(Icons.shopping_basket_outlined, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CutomBottomAppBar(),
        body: WillPopScope(
          onWillPop: () {
            alertExitApp();
            return Future.value(false);
          },
          child: controller.listPage.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
