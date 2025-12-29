import 'package:ecommerce/controller/address/add_address_details_controller.dart';
import 'package:ecommerce/core/classes/handlingdataview.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/customebuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  final controller = Get.put(AddAddressDetailsController());

  AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address Details'),
        centerTitle: true,
      ),
      body: GetBuilder<AddAddressDetailsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  CustomTextFormAuth(
                    hinttext: "EX: work, home, etc..",
                    label: "Type",
                    iconData: Icons.home_work_outlined,
                    mycontroller: controller.type!,
                    valid: (val) {
                      return validInput(val!, 3, 30, "Text input");
                    },
                  ),
                  CustomTextFormAuth(
                    hinttext: "City",
                    label: "City",
                    iconData: Icons.location_city_rounded,
                    mycontroller: controller.city!,
                    valid: (val) {
                      return validInput(val!, 3, 30, "Text input");
                    },
                  ),
                  CustomTextFormAuth(
                    hinttext: "Street",
                    label: "Street",
                    iconData: Icons.add_road,
                    mycontroller: controller.street!,
                    valid: (val) {
                      return validInput(val!, 3, 30, "Text input");
                    },
                  ),
                  CustomButtonAuth(
                    buttonText: "Add Location",
                    onPressed: () {
                      controller.addAddress();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
