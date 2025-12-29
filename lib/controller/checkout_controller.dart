import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? payment;
  String? delivery;
  String? locationId;
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));

  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  choosePayment(String val) {
    payment = val;
    update();
  }

  chooseDelivery(String val) {
    delivery = val;
    update();
  }

  chooseLocation(String val) {
    locationId = val;
    update();
  }

  getLocationAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddress(
      myServices.sharedPref.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLocationAddress();
  }
}
