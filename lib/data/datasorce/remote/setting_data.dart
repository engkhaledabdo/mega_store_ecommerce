import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class SettingsData {
  Crud crud;
  SettingsData(this.crud);

  getData({required String usersid}) async {
    var response = await crud.postData(AppLink.settings, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
