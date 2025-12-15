import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  MyServices myServices = Get.find();

  FavortieData favortieData = FavortieData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  addData(String itemsId, String itemName) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favortieData.addData(
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

  removeData(String itemsId, String itemName) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favortieData.removeData(
      myServices.sharedPref.getString("id")!,
      itemsId,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.snackbar(
          "Removed successfully",
          "You removed $itemName successfully",
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  Map favorite = {};

  changeFavorite(id, val) {
    favorite[id] = val;
    update();
  }
}
