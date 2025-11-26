import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orders_archive_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/refresh_page.dart';
import '../../widget/orders/archive_card_order_list.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersArchiveController controller = Get.put(OrdersArchiveController());
    // controller.refreshOrder();
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<OrdersArchiveController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: RefreshPage(
                  onRefresh: controller.onRefreshPage,
                  widget: ListView.builder(
                    itemCount: controller.dataOrders.length,
                    itemBuilder: (context, index) {
                      return ArchiveCardOrderList(
                        listModel: controller.dataOrders[index],
                      );
                    },
                  ),
                ),
              )),
    );
  }
}
