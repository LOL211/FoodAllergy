// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'FileSetup.dart';
import 'food.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? nameSearch = "";
  void runme([String tex = ""]) {
    setState(() {
      if (tex == '')
        nameSearch = null;
      else
        nameSearch = tex;
    });
  }

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FileSetup.writeDefault();

    return Column(children: [
      Container(
          child: TextField(
            //controller: searchController,
            onChanged: (text) => {runme(text)},
          ),
          padding: const EdgeInsets.all(8)),
      Expanded(
          child: FutureBuilder<List<Food>>(
              future: FileSetup.readFile(nameSearch),
              builder: (context, AsyncSnapshot<List<Food>> curState) {
                if (curState.hasData)
                  return FoodList(curState.data);
                else
                  return const CircularProgressIndicator();
              }))
    ]);
  }
}

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
      trailing: const IconButton(
        icon: Icon(Icons.settings),
        onPressed: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.li!.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildrow(widget.li![index]);
        });
  }
}
