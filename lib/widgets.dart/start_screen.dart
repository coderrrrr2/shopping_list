import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list_app/models/categories.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/screens/new_items.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<GroceryItem> data = [];
  bool isloading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    final url = Uri.https(
        "flutter-prep-416c7-default-rtdb.firebaseio.com", 'shopping-list.json');
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      setState(
        () {
          error = "failed to fetch data, please try again later.";
        },
      );
    }
    if (response.body == "null") {
      setState(() {
        isloading = false;
      });
      return;
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (element) => element.value.title == item.value["category"])
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          category: category,
          amount: item.value["amount"],
        ),
      );
    }
    setState(() {
      data = loadedItems;
      isloading = false;
    });
  }

  void addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (BuildContext context) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    } else {
      setState(() {
        data.add(newItem);
      });
    }
  }

  void saveItem(GroceryItem item) async {
    final url = Uri.https(
        "flutter-prep-416c7-default-rtdb.firebaseio.com", 'shopping-list.json');

    await http.post(
      url,
      headers: {'content-Type': 'application/json'},
      body: json.encode(
        {
          "name": item.name,
          "category": item.category.title,
          "amount": item.amount
        },
      ),
    );
  }

  void removeItem(GroceryItem item) async {
    setState(() {
      data.remove(item);
    });
    final url = Uri.https("f", 'shopping-list/${item.id}.json');
    await http.delete(url);
  }

  @override
  Widget build(BuildContext context) {
    late Widget currentScreen;

    if (isloading) {
      currentScreen = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (data.isEmpty) {
      currentScreen = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "No Items in the List ",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "add some items to get started",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20),
            ),
          )
        ],
      );
    }

    if (data.isNotEmpty) {
      setState(() {
        currentScreen = ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Dismissible(
            key: ValueKey<String>(
              data[index].id,
            ),
            onDismissed: (direction) {
              var currentItem = data[index];
              removeItem(currentItem);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Item removed from list"),
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {
                      saveItem(currentItem);
                      setState(
                        () {
                          data.insert(
                            index,
                            currentItem,
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(data[index].name),
              leading: Container(
                  width: 24, height: 20, color: data[index].category.color),
              trailing: Text(
                data[index].amount.toString(),
              ),
            ),
          ),
        );
      });
    }

    if (error != null) {
      currentScreen = Center(child: Text(error!));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your groceries"),
          actions: [
            IconButton(
              onPressed: addItem,
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
        body: currentScreen);
  }
}
