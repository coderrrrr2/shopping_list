import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: (value) {
                  return 'demo';
                },
              ),
              const SizedBox(
                height: 10,
              ),
              LayoutBuilder(
                builder: (context, constraint) {
                  double width = constraint.maxWidth;
                  return SizedBox(
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(label: Text("Quantitiy")),
                            initialValue: "1",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropdownButtonFormField(
                            items: [
                              for (final category in categories.entries)
                                DropdownMenuItem(
                                  value: category.key,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: category.value.color,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(category.value.title)
                                    ],
                                  ),
                                )
                            ],
                            onChanged: (value) {},
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Reset',
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Add item'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
