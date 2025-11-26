import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/testapi_controller.dart';

class TestApiView extends StatelessWidget {
  const TestApiView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestApiController());
    return Scaffold(
      body: GetBuilder<TestApiController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(title: Text(controller.data[index]['title'])),
              );
            },
          );
        },
      ),
    );
  }
}
