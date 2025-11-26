import 'package:flutter/material.dart';


import '../../../core/constant/colors.dart';
import 'archive.dart';
import 'pinding.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Orders"),
          bottom: const TabBar(labelColor: AppColor.primaryColor, tabs: [
            Tab(
              text: "Pending",
            ),
            Tab(
              text: "Archive",
            )
          ]),
        ),
        body: const TabBarView(
          children: [
            OrdersPending(),
            OrdersArchive(),
          ],
        ),
      ),
    );
  }
}
