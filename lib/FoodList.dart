// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import 'food.dart';

class FoodList extends StatefulWidget {
  final List<Food>? li;
  const FoodList(this.li, {Key? key}) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  Widget _buildrow(Food f) {
    Color r;
    switch (f.getState) {
      case state.green:
        r = Colors.green;
        break;
      case state.red:
        r = Colors.red;
        break;
      case state.yellow:
        r = Colors.yellow;
        break;
    }
    Widget color = Container(
      color: r,
      width: 20,
    );
    return ListTile(
      leading: color,
      title: Text(f.getName), //, color]),
      subtitle: Text(EnumToString.convertToString(f.getType)),
      trailing: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () => print('my id is ' + f.getID.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.li!.isEmpty)
      return const Text('There is nothing found with these filters!');

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.li!.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildrow(widget.li![index]);
        });
  }
}
