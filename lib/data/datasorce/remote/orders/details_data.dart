
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData({required String cartOrdersID}) async {
    var response = await crud
        .postData(AppLink.ordersDetails, {"cartorders": cartOrdersID});
    return response.fold((l) => l, (r) => r);
  }
}
