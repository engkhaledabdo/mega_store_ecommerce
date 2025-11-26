import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/cart_controller.dart';
import '../../../core/constant/colors.dart';
import 'custom_button_coupon.dart';
import 'custombuttoncart.dart';

class CustomBottomNavigationCart extends StatelessWidget {
  const CustomBottomNavigationCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalPrice,
      required this.onPressed,
      required this.controllerCoupon,
      required this.onApplyCoupon});
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final TextEditingController controllerCoupon;
  final void Function() onPressed;
  final void Function() onApplyCoupon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        GetBuilder<CartControllerImp>(
          builder: (controller) => controller.couponName == null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: controllerCoupon,
                          decoration: const InputDecoration(
                              hintText: "Coupon Code",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              border: OutlineInputBorder()),
                        )),
                    const SizedBox(width: 5),
                    Expanded(
                        child: CustomButtonCoupon(
                      text: "Apply",
                      onPressed: onApplyCoupon,
                    ))
                  ]),
                )
              : Container(
                  child: Text(
                    "Coupon Code : ${controller.couponName!}",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: AppColor.primaryColor, width: 1)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          const Text("Price", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price \$",
                          style: const TextStyle(fontSize: 16))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("Discount",
                          style: TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$discount %",
                          style: const TextStyle(fontSize: 16))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("Shipping",
                          style: TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$shipping \$",
                          style: const TextStyle(fontSize: 16))),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("Total Price",
                          style: TextStyle(
                              fontSize: 16, color: AppColor.primaryColor))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalPrice \$",
                          style: const TextStyle(
                              fontSize: 16, color: AppColor.primaryColor))),
                ],
              ),
            ],
          ),
        ),
        // const SizedBox(height: 10),
        CustomButtonCart(
          text: "Order",
          onPressed: onPressed,
        )
      ]),
    );
  }
}
