import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/homepage_controller.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/class/refresh_page.dart';
import '../../core/constant/approutes.dart';
import '../widget/customappbar.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listcategorieshome.dart';
import '../widget/home/listitemsdiscounthome.dart';
import '../widget/home/listitemshome.dart';
import '../widget/search/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return SafeArea(
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CustomAppBar(
                titleAppBar: "39".tr,
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onPressedFavorite: () {
                  Get.toNamed(AppRoute.myFavotite);
                },
                mycontroller: controller.search!,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
              ),
              Expanded(
                child: RefreshPage(
                  onRefresh: controller.onRefreshPage,
                  widget: ListView(
                    children: [
                      HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.settings.isNotEmpty)
                                    CustomCardHome(
                                        title: controller.settings[0]
                                            ['settings_titlehome'],
                                        body: controller.settings[0]
                                            ['settings_bodyhome']),
                                  CustomTitleHome(title: "42".tr),
                                  const ListCategoriesHome(),
                                  CustomTitleHome(title: "43".tr),
                                  const ListItemsHome(),
                                  CustomTitleHome(title: "Discount".tr),
                                  const ListItemsDiscountHome(),
                                ],
                              )
                            : ListItemsSearch(
                                listdatamodel: controller.listdata),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
