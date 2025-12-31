import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/pending_orders_data.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:get/get.dart';

class PendingController extends GetxController {
  PendingOrdersData pendingData = PendingOrdersData(Get.find());

  List<PendingOrderModel> data = [];

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  String printOrderType(val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Pick Up";
    }
  }

  String printPaymentMethod(val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Card";
    }
  }

  String printOrderStatus(val) {
    if (val == "0") {
      return "Waiting Approval";
    } else if (val == "1") {
      return "Preparing Your Order";
    } else if (val == "2") {
      return "Your Order Is On Its Way";
    } else {
      return "Archived";
    }
  }

  getPendingOrders() async {
    statusRequest = StatusRequest.loading;
    var response = await pendingData.getOrders(
      myServices.sharedPref.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => PendingOrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getPendingOrders();
    super.onInit();
  }
}
