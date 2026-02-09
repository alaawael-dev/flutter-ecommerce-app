import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/order_details_data.dart';
import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  late PendingOrderModel orderModel;

  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    orderModel = Get.arguments["ordersmodel"];
    getDataController();
    super.onInit();
  }

  getDataController() async {
    statusRequest = StatusRequest.loading;
    var response = await orderDetailsData.getData(orderModel.ordersId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


}
