import 'package:flutter/material.dart';

import 'food.dart';

class AddEdit extends StatelessWidget {
  final Food? food;
  const AddEdit(this.food);

  @override
  Widget build(BuildContext context) {
    if (food != null) {}
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ));
  }
}
