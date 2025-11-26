
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData({required String usersID}) async {
    var response =
        await crud.postData(AppLink.ordersArchive, {"usersid": usersID});
    return response.fold((l) => l, (r) => r);
  }

  rating(
      {required String ordersID,
      required String rating,
      required String comment}) async {
    var response = await crud.postData(AppLink.rating, {
      "orderid": ordersID,
      "rating": rating,
      "comment": comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
