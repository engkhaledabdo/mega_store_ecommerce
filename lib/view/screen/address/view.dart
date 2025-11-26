import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/address/view_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/approutes.dart';
import '../../widget/address/card_address.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAdressController controller = Get.put(ViewAdressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressAddMap);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ViewAdressController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(
                  addressModel: controller.data[index],
                  onDelete: () {
                    controller.delete(
                        addressID: controller.data[index].addressId.toString());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
