import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_Item.dart';

const categories = {
  Categories.vegetables: GroceryItem(
    name: 'Vegetables',
    color: Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: GroceryItem(
    name: 'Fruit',
    color: Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: GroceryItem(
    name: 'Meat',
    color: Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: GroceryItem(
    name: 'Dairy',
    color: Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: GroceryItem(
    name: 'Carbs',
    color: Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: GroceryItem(
    name: 'Sweets',
    color: Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: GroceryItem(
    name: 'Spices',
    color: Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: GroceryItem(
    name: 'Convenience',
    color: Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: GroceryItem(
    name: 'Hygiene',
    color: Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: GroceryItem(
    name: 'Other',
    color: Color.fromARGB(255, 0, 225, 255),
  ),
};
