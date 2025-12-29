import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  getAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getAddress(
      myServices.sharedPref.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String addressId) {
    addressData.deleteAddress(addressId);
    data.removeWhere((element) => element.addressId == int.parse(addressId));
    update();
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
