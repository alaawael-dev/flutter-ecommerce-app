import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/consts/routes.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
  add();
  remove();
  goToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController());

  late ItemModel itemModel;
  int itemCount = 0;
  late StatusRequest statusRequest;

  List subItems = [
    {"name": "red", "id": "1", "active": "0"},
    {"name": "yellow", "id": "2", "active": "1"},
    {"name": "blue", "id": "3", "active": "0"},
  ];

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemModel = Get.arguments["itemModel"];
    itemCount = await cartController.viewCount(itemModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  add() {
    cartController.addData(itemModel.itemsId.toString(), itemModel.itemsName!);
    itemCount++;
    update();
  }

  @override
  remove() {
    if (itemCount > 0) {
      cartController.deleteData(
        itemModel.itemsId.toString(),
        itemModel.itemsName!,
      );
      itemCount--;
    }
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
