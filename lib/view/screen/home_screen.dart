import 'package:ecommerce/controller/home_screen_cotroller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/view/widget/home/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primarycolor,
            shape: CircleBorder(),
            elevation: 0,
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: Icon(Icons.shopping_basket_outlined, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomAppbar(),
          appBar: AppBar(title: const Text('A U R A'), centerTitle: true),
          body: controller.pagesList.elementAt(controller.currentPage),
        );
      },
    );
  }
}
