

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(
      {required String username,
      required String password,
      required String email,
      required String phone}) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
