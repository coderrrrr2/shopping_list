import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/shopping_list_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.currentObject});

  final ShoppingModel currentObject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 30, // Set the width
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: currentObject.colorCode,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(currentObject.name)),
          Text(
            currentObject.amount.toString(),
          )
        ],
      ),
    );
  }
}
