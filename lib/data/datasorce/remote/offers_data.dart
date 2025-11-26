

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
