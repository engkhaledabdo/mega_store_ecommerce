import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      title: 'Mega Store',
      debugShowCheckedModeBanner: false,
      theme: controller.AppTheme,
      locale: controller.language,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
