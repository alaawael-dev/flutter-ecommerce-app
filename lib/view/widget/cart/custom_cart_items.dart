import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/api_link.dart';
import 'package:flutter/material.dart';

class CustomCartItems extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imageName;
  final void Function() onAdd;
  final void Function() onRemove;
  const CustomCartItems({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imageName, required this.onAdd, required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imageItems}/$imageName",
              height: 90,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(name),
              subtitle: Text(price, style: TextStyle(color: Colors.red)),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                ),
                Container(child: Text(count)),
                SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: onRemove,
                    icon: Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
