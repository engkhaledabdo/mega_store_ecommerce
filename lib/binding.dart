import 'package:get/get.dart';


import 'controller/auth/forgetpassword/forgetpassword_controller.dart';
import 'controller/auth/signup_controller.dart';
import 'core/class/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpCotrollerImp(), fenix: true);
    Get.lazyPut(() => ForgetPasswordCotrollerImp(), fenix: true);
    Get.put(Crud());
    Get.put(CrudMix());
  }
}
