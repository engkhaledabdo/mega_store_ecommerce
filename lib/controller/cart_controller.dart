import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/class/statusRequest.dart';
import '../core/constant/approutes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasorce/remote/cart_data.dart';
import '../data/model/cart.dart';
import '../data/model/coupon.dart';

abstract class CartController extends GetxController {
  addCart({required String itemsId});
  deleteCart({required String itemsId});
  getCountItems({required String itemsId});
  viewCart();
  back();
  goToPageCheckout();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  double priceOrders = 0.0;
  int totalCountItems = 0;

  TextEditingController? controllerCoupon;
  CouponModel? couponModel;
  int? discountcoupon = 0;
  String? couponName;
  String? couponID;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  addCart({required String itemsId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
      usersId: myServices.sharedPreferences.getString("id")!,
      itemsId: itemsId,
    );
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافه المنتج الى السلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  deleteCart({required String itemsId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
      usersId: myServices.sharedPreferences.getString("id")!,
      itemsId: itemsId,
    );
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازاله المنتج من السلة"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  getCountItems({required String itemsId}) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountItems(
      usersId: myServices.sharedPreferences.getString("id")!,
      itemsId: itemsId,
    );
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response["data"]);
        debugPrint("============================");
        debugPrint("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  resetVarCart() {
    totalCountItems = 0;
    priceOrders = 0.0;
    data.clear();
  }

  refreskPage() {
    resetVarCart();
    viewCart();
    data.clear();
  }

  @override
  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.viewCart(
      usersId: myServices.sharedPreferences.getString("id")!,
    );
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List responseData = response['datacart']['data'];
          Map responseDataCountPrice = response['countPrice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalCountItems = int.parse(responseDataCountPrice['totalcount'].toString());
          priceOrders = double.parse(responseDataCountPrice['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.checkCoupon(couponName: controllerCoupon!.text);
    debugPrint('==================== Cart Controller $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount.toString());
        couponName = couponModel!.couponName!;
        couponID = couponModel!.couponId.toString();
      } else {
        // statusRequest = StatusRequest.none;
        discountcoupon = 0;
        couponName = null;
        couponID = null;
        Get.snackbar("Worrning", "Coupon Not valid");
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceOrders - priceOrders * discountcoupon! / 100);
  }

  @override
  back() {
    Get.back();
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    viewCart();
    super.onInit();
  }

  @override
  goToPageCheckout() {
    if (data.isEmpty) {
      return Get.snackbar("Worning", "Cart is Empty");
    }
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponID ?? "0",
      "priceorder": priceOrders.toString(),
      "coupondiscount": discountcoupon.toString(),
    });
  }
}
