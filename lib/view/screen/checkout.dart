import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/checkout_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/approutes.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/imageasset.dart';
import '../../core/shared/defult_button.dart';
import '../widget/checkout/card_address_checkout.dart';
import '../widget/checkout/card_delivarytype.dart';
import '../widget/checkout/card_payment_method.dart';
import '../widget/checkout/checkout_title.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustomDefultButton(
          text: "Order",
          onPressed: () {
            controller.checkout();
          },
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const CheckoutTitle(title: "Choose Payment Method"),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("0"); //cash
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Cash On Delivary",
                    isActive: controller.paymentMethod == "0" ? true : false,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("1"); //card
                  },
                  child: CardPaymentMethodCheckout(
                    title: "Payment Card",
                    isActive: controller.paymentMethod == "1" ? true : false,
                  ),
                ),
                const SizedBox(height: 10),
                const CheckoutTitle(title: "Choose Delivary Type"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardDelivaryTypeCheckout(
                        title: "Delivary",
                        imageUrl: AppImageAsset.delivery,
                        active: controller.delivaryType == "0" ? true : false,
                        onTap: () {
                          controller.chooseDelivaryType("0"); //delivary
                        }),
                    const SizedBox(width: 20),
                    CardDelivaryTypeCheckout(
                        title: "Store",
                        imageUrl: AppImageAsset.store,
                        active: controller.delivaryType == "1" ? true : false,
                        onTap: () {
                          controller.chooseDelivaryType("1"); //store
                        }),
                  ],
                ),
                const SizedBox(height: 10),
                if (controller.delivaryType == "0") // delivary
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CheckoutTitle(title: "Choose Address"),
                      if (controller.dataAddress.isEmpty)
                        InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.addressAddMap);
                            },
                            child: Container(
                              child: const Center(
                                  child: Text(
                                "Please Add Shipping Address \n Click Here",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              )),
                            )),
                      const SizedBox(height: 10),
                      ...List.generate(
                        controller.dataAddress.length,
                        (index) => CardAdressCheckout(
                          title: "${controller.dataAddress[index].addressName}",
                          subTitle:
                              "${controller.dataAddress[index].addressCity} - ${controller.dataAddress[index].addressStreet}",
                          isactive: controller.addressId ==
                                  controller.dataAddress[index].addressId
                              ? true
                              : false,
                          onTap: () {
                            controller.chooseShippingAddress(
                                controller.dataAddress[index].addressId.toString());
                          },
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
