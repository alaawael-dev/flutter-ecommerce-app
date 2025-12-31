import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address_data.dart';
import 'package:ecommerce/data/datasource/remote/checkout_data.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String? payment;
  String? delivery;
  String locationId = "0";
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  late String couponId;
  late String priceOrders;
  late String coupDiscount;

  choosePayment(String val) {
    payment = val;
    update();
  }

  chooseDelivery(String val) {
    delivery = val;
    update();
  }

  chooseLocation(String val) {
    locationId = val;
    update();
  }

  getLocationAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddress(
      myServices.sharedPref.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  orderCheckout() async {
    if (payment == null) return Get.snackbar("Error", "please choose a payment method");
    if (delivery == null) return Get.snackbar("Error", "please choose a delivery method");
    if (delivery == "0" && locationId == "0") return Get.snackbar("Error", "please choose a location");
    

    statusRequest = StatusRequest.loading;
    update();
    Map dataCheckout = {
      "usersid": myServices.sharedPref.getString("id")!,
      "addressid": locationId,
      "ordertype": delivery,
      "orderprice": priceOrders,
      "paymentmethod": payment,
      "shippingprice": "10",
      "coupdiscount": coupDiscount,
      "coupon": couponId,
    };
    var response = await checkoutData.addOrder(dataCheckout);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("success");
        Get.offAllNamed(AppRoute.home);
        Get.snackbar("Success", "Your order was placed successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Please try again");
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLocationAddress();
    couponId = Get.arguments['couponid'];
    priceOrders = Get.arguments['priceorders'];
    coupDiscount = Get.arguments['coupdiscount'];
  }
}
