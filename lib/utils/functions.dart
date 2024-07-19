import 'package:get/get.dart';

bool isNullOrBlank(dynamic val) {
  if (GetUtils.isNullOrBlank(val) == true) {
    return true;
  } else if (val is List) {
    if (val.isEmpty) return true;
    return false;
  } else {
    if (val == null || val == '' || val == 'null' || val.toString().isEmpty) {
      return true;
    }
  }
  return false;
}