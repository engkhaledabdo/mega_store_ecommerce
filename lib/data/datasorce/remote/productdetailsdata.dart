
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class ProductDetailsData {
  Crud crud;
  ProductDetailsData(this.crud);

  getData({required String categoriesId}) async {
    var response = await crud.postData(
      AppLink.itemsDetails,
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
