import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/notification_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../widget/notification/notification_list_card.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    // controller.refreshNotification();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
        ),
        body: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.dataNotification.length,
                itemBuilder: (context, index) {
                  return NotificationListCard(
                    listdata: controller.dataNotification[index],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
