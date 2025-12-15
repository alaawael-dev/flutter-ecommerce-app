import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart_data.dart';
import 'package:ecommerce/data/model/cart_model.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addCart(String itemsId, [String? itemName]);
  deleteCart(String itemsId, [String? itemName]);
  count(String itemsId);
  view();
  resetVarCart();
  refresh();
}

class CartControllerImp extends CartController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  double orderPrice = 0.0;
  int totalItems = 0;
  bool _isFetching = false;
  DateTime? _lastFetchTime;

  @override
  addCart(itemsId, [itemName]) async {
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
        Get.snackbar(
          "Added successfully",
          "You added $itemName successfully to your cart",
          duration: Duration(seconds: 1),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  deleteCart(itemsId, [itemName]) async {
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
          "Deleted successfully",
          "You Deleted $itemName successfully to your cart",
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  count(itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCount(
      myServices.sharedPref.getString("id")!,
      itemsId,
    );
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int count = 0;
        count = response['data'];
        return count;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  Future<void> forceFetchCart() async {
    _lastFetchTime = null; // allow view() to run
    await view();
  }

  @override
  view() async {
    // 1) Prevent re-entry (no overlapping requests)
    if (_isFetching) {
      print("view(): skipped — already fetching");
      return;
    }

    // 2) Prevent too many rapid calls (min interval)
    if (_lastFetchTime != null) {
      final diff = DateTime.now().difference(_lastFetchTime!);
      if (diff.inMilliseconds < 800) {
        print("view(): skipped — min interval not passed ($diff)");
        return;
      }
    }

    // 3) Mark start
    _isFetching = true;
    _lastFetchTime = DateTime.now();
    print("view(): FETCH START");

    statusRequest = StatusRequest.loading;
    update();

    try {
      // 4) Send request
      var response = await cartData.view(
        myServices.sharedPref.getString("id")!,
      );

      print("CART VIEW RESPONSE: $response");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest &&
          response['status'] == 'success') {
        if (response['cartdata']['status'] == 'success') {
          List dataResponse = response['cartdata']['data'];
          Map countResponse = response['countprice'];

          // 5) Fill the list
          data.clear();
          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));

          // 6) Parse totals
          totalItems =
              int.tryParse(countResponse['totalcount'].toString()) ?? 0;
          orderPrice =
              double.tryParse(countResponse['totalprice'].toString()) ?? 0.0;

          print("DEBUG: parsed totalItems=$totalItems, orderPrice=$orderPrice");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e, s) {
      print("view() EXCEPTION: $e\n$s");
      statusRequest = StatusRequest.failure;
    } finally {
      // 7) Mark request finished
      _isFetching = false;
      update();
      print(
        "view(): FETCH END → totalItems=$totalItems, data.length=${data.length}",
      );
    }
  }

  @override
  resetVarCart() {
    orderPrice = 0.0;
    totalItems = 0;
    data.clear();
  }

  @override
  void refresh() {
    // resetVarCart();
    view();
  }

  @override
  void onInit() {
    view();
    
    super.onInit();
  }
}
