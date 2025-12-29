import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  String? lat;
  String? long;

  TextEditingController? type;
  TextEditingController? city;
  TextEditingController? street;

  initialData() {
    lat = Get.arguments['latitude'];
    long = Get.arguments['longitude'];

    type = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    print(long);
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
      myServices.sharedPref.getString("id")!,
      type!.text,
      city!.text,
      street!.text,
      long!,
      lat!,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
        Get.snackbar("Added", "New location added successfully");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initialData();
  }
}
