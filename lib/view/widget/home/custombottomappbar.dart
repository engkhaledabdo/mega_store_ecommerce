import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/homescreen_controller.dart';
import 'custombuttonappbar.dart';

class CutomBottomAppBar extends StatelessWidget {
  const CutomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomButtonAppBar(
                      textButton: controller.bottomAppBar[i]["title"],
                      icon: controller.bottomAppBar[i]["icon"],
                      active: controller.currentPage == i ? true : false,
                      onPressed: () {
                        controller.changePage(i);
                      },
                    );
            }),
          ],
        ),
      );
    });
  }
}
