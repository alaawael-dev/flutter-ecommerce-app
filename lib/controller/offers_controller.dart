import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/offers_data.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchingController {
  OffersData offersData = OffersData(Get.find());

  List<ItemModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  getDataController() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData2 = response['data'];
        data.clear();
        data.addAll(listData2.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(itemModel) {
    Get.toNamed("productdetails", arguments: {"itemModel": itemModel});
  }

  @override
  void onInit() {
    getDataController();
    search = TextEditingController();
    super.onInit();
  }
}
