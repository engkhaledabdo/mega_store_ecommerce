// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'controller/test_controller.dart';
import 'core/class/handlingdataview.dart';
import 'core/constant/colors.dart';
import 'core/functions/checkinternet.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  var res;
  intialdata() async {
    res = await checkInternet();
    debugPrint(res.toString());
  }

  @override
  void initState() {
    intialdata();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Text Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            ),
          );

          // if (controller.statusRequest == StatusRequest.loading) {
          //   return const Center(child: Text("Loading"));
          // } else if (controller.statusRequest == StatusRequest.offlinefailure) {
          //   return const Center(child: Text("offline"));
          // } else if (controller.statusRequest == StatusRequest.serverfailure) {
          //   return const Center(child: Text("Server Failure"));
          // } else if (controller.statusRequest == StatusRequest.failure) {
          //   return const Center(child: Text("No Data"));
          // } else {
          //   return ListView.builder(
          //     itemCount: controller.data.length,
          //     itemBuilder: (context, index) {
          //       return Text("${controller.data}");
          //     },
          //   );
          // }
        },
      ),
    );
  }
}
