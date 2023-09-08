// ignore_for_file: file_names

import 'package:shopping_list_app/models/category.dart';

class GroceryItem {
  const GroceryItem(
      {required this.id,
      required this.name,
      required this.category,
      required this.amount});

  final String name;
  final String id;
  final int amount;
  final Category category;
}
