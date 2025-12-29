import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/coupon_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<CartModel> data = [];

  TextEditingController? coupController;

  double priceOrders = 0.0;
  int totalCountItems = 0;

  CouponModel? couponModel;

  int coupDiscount = 0;
  String? coupName;

  addData(String itemsId, {String? itemName}) async {
    statusRequest = StatusRequest.loading;
    update();
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
    update();
  }

  deleteData(String itemsId, {String? itemName}) async {
    statusRequest = StatusRequest.loading;
    update();
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
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response = await cartData.view(myServices.sharedPref.getString("id")!);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['status'] == 'success') {
          List dataResponse = response['cartdata'];
          Map dataResponseCountPrice = response['countprice'];
          data.clear();
          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
          totalCountItems = int.parse(dataResponseCountPrice['totalcount']);
          priceOrders = dataResponseCountPrice['totalprice'].toDouble();
          print(data);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  viewCount(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
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
    update();
  }

  getCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCoupon(coupController!.text);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> coupondata = response['data'];
        couponModel = CouponModel.fromJson(coupondata);
        coupDiscount = couponModel!.couponDiscount;
        coupName = couponModel!.couponName;
      } else {
        coupDiscount = 0;
        coupName = null;
      }
    }
    update();
  }

  getFinalPrice() {
    return priceOrders - (priceOrders * coupDiscount / 100);
  }

  resetVarCart() {
    totalCountItems = 0;
    priceOrders = 0.0;
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  @override
  void onInit() {
    view();
    coupController = TextEditingController();
    super.onInit();
  }
}
