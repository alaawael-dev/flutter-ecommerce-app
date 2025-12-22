import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchingController {
  initialData();
  getData();
  goToItemsPage(List categories, int selectedCat, String catId);
  searchData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  HomeData homedata = HomeData(Get.find());

  List categories = [];
  List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPref.getString("username");
    id = myServices.sharedPref.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemsPage(categories, selectedCat, catId) {
    Get.toNamed(
      AppRoute.items,
      arguments: {
        "categories": categories,
        "selectedCat": selectedCat,
        "catId": catId,
      },
    );
  }

  goToProductDetails(itemModel) {
    Get.toNamed("productdetails", arguments: {"itemModel": itemModel});
  }

  @override
  void onInit() {
    initialData();
    search = TextEditingController();
    getData();
    super.onInit();
  }
}

class SearchingController extends GetxController {
  HomeData homedata = HomeData(Get.find());
  List<ItemModel> listData = [];
  TextEditingController? search;
  bool isSearching = false;
  late StatusRequest statusRequest;

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchItems(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearching = false;
    }
    update();
  }

  onSearch() {
    isSearching = true;
    searchData();
    update();
  }
}
