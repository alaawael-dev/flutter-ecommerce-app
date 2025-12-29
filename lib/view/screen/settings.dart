import 'package:ecommerce/controller/settings_controller.dart';
import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/core/consts/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Container(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.center,
            children: [
              Container(
                height: Get.width / 3,
                decoration: BoxDecoration(color: AppColor.primarycolor),
              ),
              Positioned(
                top: Get.width / 3.5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(AppImageAssets.person),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 120),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: List.generate(controller.cardInfo.length, (index) {
                    return ListTile(
                      onTap: () {
                        if (controller.cardInfo[index]["isLogout"] == true) {
                          controller.logout();
                        } else if (controller.cardInfo[index]["route"] !=
                            null) {
                          Get.toNamed(controller.cardInfo[index]["route"]);
                        }
                      },
                      title: Text(controller.cardInfo[index]["title"]),
                      trailing: Icon(controller.cardInfo[index]["trailing"]),
                    );
                  }),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
