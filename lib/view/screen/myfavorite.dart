import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/myfavorite_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/approutes.dart';
import '../widget/customappbar.dart';
import '../widget/myfavorite/customlistfavoriteitems.dart';
import '../widget/search/search.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MYFavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MYFavoriteController>(
            builder: (controller) => ListView(
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
                const SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            return CustomListFavoriteItems(
                              myFavoriteModel: controller.data[index],
                            );
                          },
                        )
                      : ListItemsSearch(listdatamodel: controller.listdata),
                )
              ],
            ),
          )),
    );
  }
}
