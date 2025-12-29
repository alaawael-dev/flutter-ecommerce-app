import 'package:ecommerce/core/consts/colors.dart';
import 'package:ecommerce/data/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;
  final void Function() onDelete;
  const AddressCard({
    super.key,
    required this.addressModel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Type: ${addressModel.type}"),
        subtitle: Text(
          "City: ${addressModel.city}  Street: ${addressModel.street}",
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: Icon(Icons.delete, color: AppColor.primarycolor),
        ),
      ),
    );
  }
}
