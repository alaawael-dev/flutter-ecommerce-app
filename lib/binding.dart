import 'package:ecommerce/controller/auth/signup_controller.dart';
// import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/classes/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    // Get.put(CartControllerImp(), permanent: true);
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
