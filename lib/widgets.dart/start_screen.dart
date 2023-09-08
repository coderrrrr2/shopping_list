import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/data.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your groceries"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(data[index].name),
                leading: Container(
                    width: 24, height: 20, color: data[index].category.color),
                trailing: Text(data[index].amount.toString()),
              )),
    );
  }
}
