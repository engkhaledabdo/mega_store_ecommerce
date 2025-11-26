import 'package:get/get.dart';

validinput(
    {required String val,
    required int min,
    required int max,
    required String type}) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not Valid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not Valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not Valid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be less than $min";
  }
}
