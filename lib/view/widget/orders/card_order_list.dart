import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';



import '../../../controller/orders/orders_pending_controller.dart';
import '../../../core/constant/approutes.dart';
import '../../../core/constant/colors.dart';
import '../../../data/model/orders_model.dart';

class CardOrderList extends GetView<OrdersPendingController> {
  const CardOrderList({super.key, required this.listModel});
  final OrdersModel listModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Order Number : #${listModel.ordersId}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(Jiffy.parse(listModel.ordersDatetime!).fromNow(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor)),
              ],
            ),
            const Divider(),
            Text(
                "Order Type : ${controller.printOrderType(listModel.ordersType!)}"),
            Text("Order Price : ${listModel.ordersPrice} \$"),
            Text("Delivary Price : ${listModel.ordersPricedelivary} \$"),
            Text(
                "Peyment Method :  ${controller.printPaymenyMethod(listModel.ordersPaymentmethod!)}"),
            Text(
                "Order Status :  ${controller.printOrderStatus(listModel.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listModel.ordersTotalprice} \$",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  color: AppColor.thirdColor,
                  textColor: AppColor.secoundColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails,
                        arguments: {"dataorders": listModel});
                  },
                  child: const Text("Details"),
                ),
                const SizedBox(width: 10),
                if (listModel.ordersStatus == "0")
                  MaterialButton(
                    color: AppColor.thirdColor,
                    textColor: AppColor.secoundColor,
                    onPressed: () {
                      controller.deleteOrders(orderid: listModel.ordersId!);
                    },
                    child: const Text("Delete"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
