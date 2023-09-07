import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class GroceryItem {
  const GroceryItem({required this.category, required this.amount});

  final Categories category;
  final int amount;
}
