import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItemsPage(List categories, int selectedCat, String catId);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
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
      arguments: {"categories": categories, "selectedCat": selectedCat, "catId" : catId},
    );
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }
}
