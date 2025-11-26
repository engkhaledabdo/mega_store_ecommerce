import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/favorite_controller.dart';
import '../../controller/offers_controller.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/class/refresh_page.dart';
import '../../core/constant/approutes.dart';
import '../widget/customappbar.dart';
import '../widget/offers/offers_custom_list_items.dart';
import '../widget/search/search.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return SafeArea(
      child: GetBuilder<OffersController>(
          builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    // const SizedBox(height: 10),
                    Expanded(
                      child: RefreshPage(
                        onRefresh: controller.onRefreshPage,
                        widget: ListView(
                          children: [
                            // CustomAppBar(
                            //   titleAppBar: "39".tr,
                            //   onPressedSearch: () {
                            //     controller.onSearchItems();
                            //   },
                            //   onPressedFavorite: () {
                            //     Get.toNamed(AppRoute.myFavotite);
                            //   },
                            //   mycontroller: controller.search!,
                            //   onChanged: (val) {
                            //     controller.checkSearch(val);
                            //   },
                            // ),
                            // const SizedBox(height: 10),
                            HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: !controller.isSearch
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller.data.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.6),
                                      itemBuilder: (context, index) {
                                        // controllerFav.isFavorite[controller.data[index]
                                        //         ['items_id']] =
                                        //     controller.data[index]['favorite'];
                                        return OffersCustomListItems(
                                          itemsModel: controller.data[index],
                                        );
                                      },
                                    )
                                  : ListItemsSearch(
                                      listdatamodel: controller.listdata),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}


// HandlingDataView(
//                           statusRequest: controller.statusRequest,
//                           widget: ListView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: controller.data.length,
//                             itemBuilder: (context, index) {
//                               return OffersCustomListItems(
//                                   itemsModel: controller.data[index]);
//                             },
//                           ),
//                         )