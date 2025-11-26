
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class TestAPiData {
  CrudMix crud;
  TestAPiData(this.crud);

  getData() async {
    var response = await crud.request(AppLink.testapi, {}, HttpMethod.get);
    return response.fold((l) => l, (r) => r);
  }
}
