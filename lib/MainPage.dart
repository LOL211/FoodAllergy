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
  // String? nameSearch = "";
  // state? stateColor = null;
  // void runme([String tex = "", Color stateC = Colors.white]) {
  //   setState(() {
  //     if (tex == '')
  //       nameSearch = null;
  //     else
  //       nameSearch = tex;
  //     if (stateC != Colors.white) {
  //       switch (stateC) {
  //         case Colors.green:
  //           stateColor = state.green;
  //       }
  //     }
  //   });
  // }

  // void setNameFilter(String fil) {
  //   FileSetup.setNameFilter(fil);
  // }

  @override
  Widget build(BuildContext context) {
    FileSetup.writeDefault();

    return Column(children: [
      Container(
          child: TextField(
            onChanged: (text) => {FileSetup.setNameFilter(text)},
          ),
          padding: const EdgeInsets.all(8)),
      Container(
          child: Row(children: [
            DropdownButton<Color>(
              items: <Color>[
                Colors.white,
                Colors.red,
                Colors.yellow,
                Colors.green
              ].map<DropdownMenuItem<Color>>((Color value) {
                return DropdownMenuItem<Color>(
                    value: value,
                    child: Icon(Icons.brightness_1, color: value, size: 20));
              }).toList(),
              onChanged: (value) => setColorFilter(value),
            ),
          ]),
          //controller: searchController,

          padding: const EdgeInsets.all(8)),
      Expanded(
          child: FutureBuilder<List<Food>>(
              future: FileSetup.readFile(),
              builder: (context, AsyncSnapshot<List<Food>> curState) {
                if (curState.hasData)
                  return FoodList(curState.data);
                else
                  return const CircularProgressIndicator();
              }))
    ]);
  }
}

setColorFilter(Color? value) {
  String white = Colors.white.toString();
  String red = Colors.red.toString();
  String green = Colors.green.toString();
  String yellow = Colors.yellow.toString();
  if (value == Colors.white)
    FileSetup.setStateFilter(null);
  else if (value == Colors.red)
    FileSetup.setStateFilter(state.red);
  else if (value == Colors.green)
    FileSetup.setStateFilter(state.green);
  else if (value == Colors.yellow) FileSetup.setStateFilter(state.yellow);
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
