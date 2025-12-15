import 'package:ecommerce/controller/home_screen_cotroller.dart';
import 'package:ecommerce/view/widget/home/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.pagesList.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? Spacer()
                  : CustomAppBar(
                      pageName: controller.appBarTitle[i]['title'],
                      iconData: controller.appBarTitle[i]['icon'],
                      onPressed: () {
                        controller.changePage(i);
                      },
                      active: controller.currentPage == i ? true : false,
                    );
            }),
          ],
        ),
      ),
    );
  }
}
