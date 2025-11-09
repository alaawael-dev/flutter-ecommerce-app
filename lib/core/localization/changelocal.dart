import 'dart:ui';

import 'package:ecommerce/core/services/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myservices = Get.find();

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myservices.sharedPref.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myservices.sharedPref.getString("lang");

    if (sharedPrefLang == "ar") {
      language = Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
