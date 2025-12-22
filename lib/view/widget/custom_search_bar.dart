import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String searchTitle;
  final void Function() onPressedSearch;
  final void Function() onPressedFavorite;
  final TextEditingController myController;
  final void Function(String) onChange;

  const CustomSearchBar({
    super.key,
    required this.searchTitle,
    required this.onPressedSearch,
    required this.onPressedFavorite,
    required this.myController,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChange,
              controller: myController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hint: Text(searchTitle),
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(Icons.search, color: Colors.grey[600], size: 30),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
