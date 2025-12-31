import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  List cardInfo = [
    {"title": "About us", "trailing": Icons.info_outline},
    {"title": "Contact us", "trailing": Icons.phone_outlined},
    {
      "title": "My location",
      "trailing": Icons.location_on_outlined,
      "route": AppRoute.viewAddress,
    },
    {
      "title": "Pending Orders",
      "trailing": Icons.shopify_rounded,
      "route": AppRoute.pendingOrders,
    },
    {
      "title": "Archived Orders",
      "trailing": Icons.shop,
      "route": AppRoute.archiveOrders,
    },
    {
      "title": "Disable notifications",
      "trailing": Icons.notifications_off_outlined,
    },
    {"title": "Log out", "trailing": Icons.logout, "isLogout": true},
  ];

  @override
  logout() {
    myServices.sharedPref.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
