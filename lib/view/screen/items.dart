import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/favorite_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/approutes.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';
import '../widget/search/search.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
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
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                        itemBuilder: (context, index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                           
                            itemsModel: ItemsModel.fromJson(
                              controller.data[index],
                            ),
                          );
                        },
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
