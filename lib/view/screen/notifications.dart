import 'package:ecommerce/controller/notifications_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<NotificationsController>(
          builder: (controller) {
            if (controller.data.isEmpty) {
              return Center(child: Text("No notifications yet"));
            }
            return ListView(
              children: [
                ...List.generate(
                  controller.data.length,
                  (index) => Stack(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(
                            controller.data[index]["notifications_title"],
                          ),
                          subtitle: Text(
                            controller.data[index]["notifications_body"],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 15,
                        child: Text(
                          Jiffy.parse(
                            controller.data[index]["notifications_datetime"],
                          ).fromNow(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primarycolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
