// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


import '../constant/apptheme.dart';
import '../functions/fcmconfig.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData AppTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    AppTheme = langcode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(AppTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشخيل خدمه تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "تنبيه", "الرجاء اعطاء صلاحيه  تحديد الموقع للتطبيق");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق بدون اللوكيشن");
    }
  }

  @override
  void onInit() {
    requestPermissionNotifacation();
    fcmconfig();
    requestPerLocation();
    String? sharedPrefLAng = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLAng == 'ar') {
      language = const Locale('ar');
      AppTheme = themeArabic;
    } else if (sharedPrefLAng == 'en') {
      language = const Locale('en');
      AppTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      AppTheme = themeEnglish;
    }
    super.onInit();
  }
}
