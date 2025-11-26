import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/productdetails_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/approutes.dart';
import '../../core/constant/colors.dart';
import '../widget/itemsdetails/priceandcount.dart';
import '../widget/itemsdetails/subitemlist.dart';
import '../widget/itemsdetails/topitempageimage.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsImp());
    return Scaffold(

        // backgroundColor: AppColor.secoundColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.secoundColor,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 60,
            child: MaterialButton(
              onPressed: () {
                // controller.cartController.refreskPage();
                Get.toNamed(AppRoute.cart);
              },
              child: const Text(
                "Go To Cart",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              // color: Colors.white,
              child: ListView(
                children: [
                  const TopItemDetailsPageImage(),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    padding: const EdgeInsets.all(20),
                    // height: Get.height / 1.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.itemsModel.itemsName!,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColor.forthColor),
                        ),
                        PriceAndCount(
                          price:
                              "${controller.itemsModel.itemsPriceDiscount} \$",
                          count: "${controller.countitems}",
                          onAdd: () {
                            controller.addItems();
                          },
                          onRemove: () {
                            controller.removeItems();
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(controller.itemsModel.itemsDesc!,
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        // Text(
                        //   "Color",
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .displayLarge!
                        //       .copyWith(color: AppColor.forthColor),
                        // ),
                        // const SizedBox(height: 10),
                        // const SubItemList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
