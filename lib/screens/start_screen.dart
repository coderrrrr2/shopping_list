import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_list_app/models/data.dart';
import 'package:shopping_list_app/widgets.dart/list_items.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(0, 96, 125, 139),
              statusBarBrightness: Brightness.dark),
          backgroundColor: const Color.fromARGB(107, 96, 125, 139),
          title: const Text("Your groceries"),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListItem(currentObject: data[index]);
            }));
  }
}
