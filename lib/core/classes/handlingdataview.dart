import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Text("Loading"))
        : statusRequest == StatusRequest.offlinefailure
        ? Center(child: Text("Offline failutre"))
        : statusRequest == StatusRequest.serverfailure
        ? Center(child: Text("server failutre"))
        : statusRequest == StatusRequest.failure
        ? Center(child: Text("server no data"))
        : widget;
  }
}
