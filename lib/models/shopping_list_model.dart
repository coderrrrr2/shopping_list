import 'package:flutter/material.dart';

class ShoppingModel {
  const ShoppingModel(
      {required this.colorCode, required this.amount, required this.name});

  final Color colorCode;
  final int amount;
  final String name;
}
