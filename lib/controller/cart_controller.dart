import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

    addData(String itemsId, String itemName) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addData(
      myServices.sharedPref.getString("id")!,
      itemsId,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.snackbar("Added successfully", "You added $itemName successfully");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

    deleteData(String itemsId, String itemName) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteData(
      myServices.sharedPref.getString("id")!,
      itemsId,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.snackbar("Removed successfully", "You Removed $itemName successfully");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
