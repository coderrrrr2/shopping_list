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
  const GroceryItem({required this.name, required this.color});

  final Color color;
  final String name;
}
