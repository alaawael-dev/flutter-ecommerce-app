import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/view/screen/homepage.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
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
    Column(children: [Center(child: Text("Notification"))]),
    Column(children: [Center(child: Text("Profile"))]),
    Settings(),
  ];

  List appBarTitle = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Notify", "icon": Icons.notification_add_outlined},
    {"title": "Profile", "icon": Icons.person_2_outlined},
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
