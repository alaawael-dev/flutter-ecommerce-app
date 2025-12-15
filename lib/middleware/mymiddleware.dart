import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString("step") == "2") {
      return RouteSettings(name: AppRoute.home);
    }
    if (myServices.sharedPref.getString("step") == "1") {
      return RouteSettings(name: AppRoute.login);
    }
  }
}
