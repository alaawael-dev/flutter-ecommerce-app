import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/view/screen/homepage.dart';
import 'package:ecommerce/view/screen/notifications.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> pagesList = [
    HomePage(),
    NotificationsPage(),
    Offers(),
    Settings(),
  ];

  List appBarTitle = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notify", "icon": Icons.notification_add_outlined},
    {"title": "Offers", "icon": Icons.discount},
    {"title": "Settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
  }
}
