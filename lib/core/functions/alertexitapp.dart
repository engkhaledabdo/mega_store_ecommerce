import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    titleStyle: const TextStyle(
        fontWeight: FontWeight.bold, color: AppColor.primaryColor),
    title: "Worning",
    middleText: "Do you want exit from app",
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("Cancel"),
      ),
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text("Confirm"),
      ),
    ],
  );
  return Future.value(true);
}
