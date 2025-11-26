
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite({required String usersId, required String itemsId}) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite({required String usersId, required String itemsId}) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
