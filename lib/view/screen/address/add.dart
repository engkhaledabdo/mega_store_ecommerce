import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/add_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/shared/defult_button.dart';
import '../../../core/shared/defult_textformfield.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAdressController controller = Get.put(AddAdressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<AddAdressController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomDefultTextForm(
                  hintText: "Address Name",
                  lableText: "Address Name",
                  iconData: Icons.near_me,
                  myController: controller.name,
                  validator: (val) {},
                ),
                CustomDefultTextForm(
                  hintText: "Address City",
                  lableText: "Address City",
                  iconData: Icons.location_city,
                  myController: controller.city,
                  validator: (val) {},
                ),
                CustomDefultTextForm(
                  hintText: "Address Street",
                  lableText: "Address Street",
                  iconData: Icons.streetview,
                  myController: controller.street,
                  validator: (val) {},
                ),
                CustomDefultButton(
                  text: "Add",
                  onPressed: () {
                    controller.add();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
