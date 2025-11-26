import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constant/colors.dart';
import '../../../data/model/notification_model.dart';

class NotificationListCard extends StatelessWidget {
  const NotificationListCard({super.key, required this.listdata});
  final NotificationModel listdata;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ListTile(
            title: Text(
              listdata.notificationTitle!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(listdata.notificationBody!),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Text(
              Jiffy.parse(listdata.notificationDatetime!).fromNow(),
              style: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
