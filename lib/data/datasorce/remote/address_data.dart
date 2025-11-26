
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  view({required String userId}) async {
    var response = await crud.postData(AppLink.addressView, {
      "usersid": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  add({
    required String userId,
    required String name,
    required String city,
    required String street,
    required String lat,
    required String long,
  }) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": userId,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  edit(
      {required String addressId,
      required String userId,
      required String name,
      required String city,
      required String street}) async {
    var response = await crud.postData(AppLink.addressEdit, {
      "addressid": addressId,
      "usersid": userId,
      "name": name,
      "city": city,
      "street": street,
    });
    return response.fold((l) => l, (r) => r);
  }

  delete({
    required String addressId,
  }) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid": addressId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
