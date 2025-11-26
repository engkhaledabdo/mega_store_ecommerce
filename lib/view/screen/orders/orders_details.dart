import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orders_details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/colors.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text("Items",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  Text("QTY",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  Text("Price",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(
                                  children: [
                                    Text(controller.data[index].itemsName!,
                                        textAlign: TextAlign.center),
                                    Text(controller.data[index].countitems.toString(),
                                        textAlign: TextAlign.center),
                                    Text(controller.data[index].itemsPrice.toString(),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: Text(
                              "Total Price : ${controller.ordersModel.ordersTotalprice} \$",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersModel.ordersType == "0")
                    Card(
                      child: Container(
                        child: ListTile(
                          title: const Text(
                            "Shipping Address",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "${controller.ordersModel.addressCity} - ${controller.ordersModel.addressStreet}"),
                        ),
                      ),
                    ),

                  // Map
                ],
              ),
            ),
          )),
    );
  }
}
