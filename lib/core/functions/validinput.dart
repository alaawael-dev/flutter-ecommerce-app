import 'package:get/get_utils/get_utils.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Field can't be empty";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Username is not valid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Email is not valid";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Phone number is not valid";
    }
  }
  if (val.length > max) {
    return "Field can't be more than $max";
  }
  if (val.length < min) {
    return "Field can't be less than $min";
  }
}
