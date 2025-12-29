import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/classes/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(CartController(), permanent: true);
    Get.lazyPut(() => CheckoutController(), fenix: true);
    Get.lazyPut(() => ViewAddressController(), fenix: true);
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
