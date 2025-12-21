import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/api_link.dart';
import 'package:flutter/material.dart';

class CartProductCart extends StatelessWidget {
  final String title;
  final String price;
  final String count;
  final String imageName;
  final void Function() onAdd;
  final void Function() onRemove;
  const CartProductCart({
    super.key,
    required this.title,
    required this.price,
    required this.count,
    required this.imageName,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageItems}/$imageName",
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(title, style: TextStyle(fontSize: 14)),
                subtitle: Text("$price\$"),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 35,
                    child: IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                  ),
                  Container(child: Text(count)),
                  Container(
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
      ),
    );
  }
}
