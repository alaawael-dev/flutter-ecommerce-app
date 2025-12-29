import 'package:ecommerce/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:ecommerce/controller/address/add_address_controller.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddAddressController());

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Address"), centerTitle: true),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primarycolor,
        onPressed: () {
          controller.goToDetails();
        },
        child: const Icon(Icons.check, color: Colors.white),
      ),

      body: GetBuilder<AddAddressController>(
        builder: (controller) {
          if (controller.currentLatLng == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return FlutterMap(
            options: MapOptions(
              initialCenter: controller.currentLatLng!,
              initialZoom: 16,

              /// 🔥 THIS IS THE KEY PART
              onTap: (_, latLng) {
                controller.addLocation(latLng);
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.ecommerce',
              ),

              MarkerLayer(
                markers: controller.selectedLocations
                    .map(
                      (latLng) => Marker(
                        point: latLng,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
