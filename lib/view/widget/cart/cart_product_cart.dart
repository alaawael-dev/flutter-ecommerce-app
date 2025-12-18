import 'package:ecommerce/core/consts/imageassets.dart';
import 'package:flutter/material.dart';

class CartProductCart extends StatelessWidget {
  final String title;
  final String price;
  final String count;
  const CartProductCart({
    super.key,
    required this.title,
    required this.price,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                AppImageAssets.person,
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
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ),
                  Container(child: Text(count)),
                  Container(
                    height: 30,
                    child: IconButton(
                      onPressed: () {},
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
