import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/view_favorite_data.dart';
import 'package:ecommerce/data/model/favorite_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class FavoritePageController extends SearchingController{

}

class FavoritePageControllerImp extends FavoritePageController {
  MyServices myServices = Get.find();

  FavoritePageData favPage = FavoritePageData(Get.find());

  List<FavoriteModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favPage.getData(
      myServices.sharedPref.getString("id")!,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => FavoriteModel.fromJson(e)));
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  delete(String favId) {
    var response = favPage.delete(favId);
    data.removeWhere((element) => element.favoriteId.toString() == favId);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
