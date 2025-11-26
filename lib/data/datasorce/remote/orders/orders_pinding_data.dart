

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPindingData {
  Crud crud;
  OrdersPindingData(this.crud);

  getData({required String usersID}) async {
    var response =
        await crud.postData(AppLink.ordersPinding, {"usersid": usersID});
    return response.fold((l) => l, (r) => r);
  }

  deleteData({required String orderID}) async {
    var response =
        await crud.postData(AppLink.ordersDelete, {"ordersid": orderID});
    return response.fold((l) => l, (r) => r);
  }
}
