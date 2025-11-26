import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/cart_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../widget/cart/custom_bottomnavigation_cart.dart';

import '../widget/cart/customitemscartlist.dart';
import '../widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartControllerImp>(
          builder: (controller) => CustomBottomNavigationCart(
            price: "${controller.priceOrders}",
            discount: "${controller.discountcoupon}",
            shipping: "100",
            totalPrice: "${controller.getTotalPrice()}",
            controllerCoupon: controller.controllerCoupon!,
            onPressed: () {
              controller.goToPageCheckout();
            },
            onApplyCoupon: () {
              controller.checkCoupon();
            },
          ),
        ),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const SizedBox(height: 10),
                CustomTopCardCart(
                    title:
                        "You Have ${controller.totalCountItems} Item In Your List"),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => CustomItemsCartList(
                          name: "${controller.data[index].itemsName}",
                          price: "${controller.data[index].itemsprice}",
                          count: "${controller.data[index].countitems}",
                          imagename: "${controller.data[index].itemsImage}",
                          onAdd: () async {
                            await controller.addCart(
                                itemsId: controller.data[index].itemsId.toString());
                            await controller.refreskPage();
                          },
                          onRemove: () async {
                            await controller.deleteCart(
                                itemsId: controller.data[index].itemsId.toString());
                            await controller.refreskPage();
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
