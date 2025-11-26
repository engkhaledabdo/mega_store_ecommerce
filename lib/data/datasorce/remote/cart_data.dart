
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart({required String usersId, required String itemsId}) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart({required String usersId, required String itemsId}) async {
    var response = await crud.postData(AppLink.cartDelete, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountItems({required String usersId, required String itemsId}) async {
    var response = await crud.postData(AppLink.cartGetCountItems, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart({required String usersId}) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon({required String couponName}) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponname": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
