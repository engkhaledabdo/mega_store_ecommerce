

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData({required String categoriesId, required String usersId}) async {
    var response = await crud.postData(
      AppLink.items,
      {
        "id": categoriesId,
        "usersid": usersId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
