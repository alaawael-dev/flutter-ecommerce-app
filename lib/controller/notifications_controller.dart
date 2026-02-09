import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notification_data.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  MyServices myServices = Get.find();

  List data = [];

  late StatusRequest statusRequest;

  getDataController() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.getData(myServices.sharedPref.getString("id")!);
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

  @override
  void onInit() {
    getDataController();
    super.onInit();
  }

}