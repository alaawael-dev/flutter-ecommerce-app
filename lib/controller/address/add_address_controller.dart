import 'package:ecommerce/core/consts/routes.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class AddAddressController extends GetxController {
  /// Saved locations (initially empty)
  List<LatLng> selectedLocations = [];

  /// Current selected point (optional)
  LatLng? currentLatLng;

  /// Initial map position
  LatLng initialPosition = LatLng(30.0444, 31.2357); // Cairo

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) return;

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLatLng = LatLng(position.latitude, position.longitude);
    update();
  }

  /// 🔥 This is the equivalent of addMarkers(latLng)
  void addLocation(LatLng latLng) {
    currentLatLng = latLng;

    // Clear if you want only ONE address
    selectedLocations.clear();

    // Add new lat/lng
    selectedLocations.add(latLng);

    update();
  }

  String? get latitude => currentLatLng?.latitude.toString();
  String? get longitude => currentLatLng?.longitude.toString();

goToDetails() {
  if (currentLatLng == null) return;

  Get.toNamed(
    AppRoute.addAddressDetails,
    arguments: {
      "latitude": currentLatLng!.latitude.toString(),
      "longitude": currentLatLng!.longitude.toString(),
    },
  );
}
}
