import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items_data.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catVal);
  getItems(String catId);
  goToProductDetails(ItemModel itemModel);
}

class ItemsControllerImp extends SearchingController {
  List categories = [];
  int? selectedCat;
  String? catId;

  MyServices myServices = Get.find();

  ItemsData itemsData = ItemsData(Get.find());

  List data = [];

  StatusRequest statusRequest = StatusRequest.none;

  getItems(catId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(
      catId,
      myServices.sharedPref.getString("id")!,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    catId = Get.arguments["catId"];
  }

  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  goToProductDetails(itemModel) {
    Get.toNamed("productdetails", arguments: {"itemModel": itemModel});
  }

  @override
  void onInit() {
    initialData();
    search = TextEditingController();
    getItems(catId!);
    super.onInit();
  }
}
