import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/screens/new_items.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<GroceryItem> data = [];

  void addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (BuildContext context) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      data.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey<String>(
          data[index].id,
        ),
        onDismissed: (direction) {
          var currentItem = data[index];
          setState(() {
            data.removeAt(index);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Item removed from list"),
              action: SnackBarAction(
                label: "Undo",
                onPressed: () {
                  setState(
                    () {
                      log(index.toString());
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
    if (data.isEmpty) {
      setState(() {
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
      });
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
