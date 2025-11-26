import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/homepage_controller.dart';
import '../../../core/constant/colors.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  const CustomCardHome({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(children: [
          Text(title),
          Text(body),
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: controller.lang == "en" ? -105 : null,
            left: controller.lang == "ar" ? -105 : null,
            child: Container(
              height: 180,
              width: 200,
              decoration: BoxDecoration(
                  color: AppColor.secoundColor,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ]),
      ),
    );
  }
}
