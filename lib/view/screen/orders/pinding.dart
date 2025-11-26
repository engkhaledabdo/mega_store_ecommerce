import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/orders/orders_pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/refresh_page.dart';
import '../../widget/orders/card_order_list.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());

    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<OrdersPendingController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: RefreshPage(
                  onRefresh: controller.onRefreshPage,
                  widget: ListView.builder(
                    itemCount: controller.dataOrders.length,
                    itemBuilder: (context, index) {
                      return CardOrderList(
                        listModel: controller.dataOrders[index],
                      );
                    },
                  ),
                ),
              )),
    );
  }
}
