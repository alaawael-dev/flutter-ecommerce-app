import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  List<CartModel> data = [];

  double priceOrders = 0.0;
  int totalCountItems = 0;

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
        Get.snackbar(
          "Removed successfully",
          "You Removed $itemName successfully",
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  view() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.view(myServices.sharedPref.getString("id")!);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataResponse = response['cartdata'];
        Map dataResponseCountPrice = response['countprice'];
        data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
        totalCountItems = int.parse(dataResponseCountPrice['totalcount']);
        priceOrders = dataResponseCountPrice['totalprice'].toDouble();
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  viewCount(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCount(
      myServices.sharedPref.getString("id")!,
      itemsId,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        int countItems = 0;
        countItems = response['data'];
        print("==================");
        print("$countItems");
        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
