import 'package:shopping_list_app/models/category.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/models/categories.dart';

List<GroceryItem> data = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      amount: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      amount: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      amount: 1,
      category: categories[Categories.meat]!),
];
