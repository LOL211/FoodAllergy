// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:eatingblock/FileSetup.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import 'food.dart';

class AddEdit extends StatefulWidget {
  final Food? food;
  const AddEdit(this.food, {Key? key}) : super(key: key);

  @override
  State<AddEdit> createState() => _AddEditState();
}

class _AddEditState extends State<AddEdit> {
  final TextEditingController nameText = TextEditingController();

  Color dropDownIcon = Colors.green;
  state getColor(Color color) {
    if (color == Colors.green)
      return state.green;
    else if (color == Colors.red)
      return state.red;
    else
      return state.yellow;
  }

  Type dropDownType = Type.values[1];

  void saveChanges() async {
    List<Food> lis = [];
    if (widget.food != null) lis = await FileSetup.readFile();
    setState(() {
      if (widget.food == null) {
        FileSetup.writeToFileSingle(
            Food(nameText.text, getColor(dropDownIcon), dropDownType));
        Navigator.pop(context);
      } else {
        int previd = widget.food!.getID;
        lis.removeWhere((element) => widget.food!.getID == element.getID);
        lis.add(Food.edit(
            nameText.text, getColor(dropDownIcon), dropDownType, previd));
        FileSetup.writeToFile(lis);
        Navigator.pop(context);
      }
    });
  }

  static getState(state getState) {
    switch (getState) {
      case state.green:
        return Colors.green;

      case state.red:
        return Colors.red;

      case state.yellow:
        return Colors.yellow;
    }
  }

  bool firsttime = true;

  @override
  Widget build(BuildContext context) {
    if (widget.food != null && firsttime) {
      dropDownIcon =
          widget.food == null ? Colors.green : getState(widget.food!.getState);
      dropDownType =
          widget.food == null ? Type.values[0] : widget.food!.getType;

      nameText.text = widget.food!.getName;
      firsttime = false;
    }
    List<Type> typevalues = [...Type.values];
    typevalues.removeWhere((element) => element == Type.All);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.food == null ? 'Add' : 'Edit'),
        ),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: nameText,
                decoration: const InputDecoration(
                    hintText: 'Name', icon: Icon(Icons.fastfood)),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text('Color'),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.all(5),
                child: DropdownButton<Color>(
                    isDense: true,
                    value: dropDownIcon,
                    items: <Color>[Colors.red, Colors.yellow, Colors.green]
                        .map<DropdownMenuItem<Color>>((Color value) {
                      return DropdownMenuItem<Color>(
                          value: value,
                          alignment: Alignment.center,
                          child: Icon(Icons.brightness_1, color: value));
                    }).toList(),
                    onChanged: (value) => setState(() {
                          dropDownIcon = value!;
                        }))),
            Container(
                child: const Text(
                  'Type',
                ),
                padding: const EdgeInsets.all(8)),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.all(5),
                child: DropdownButton<Type>(
                    isDense: true,
                    value: dropDownType,
                    items: typevalues.map<DropdownMenuItem<Type>>((Type value) {
                      return DropdownMenuItem<Type>(
                          value: value,
                          child: Text(EnumToString.convertToString(value)));
                    }).toList(),
                    icon: const Icon(Icons.arrow_downward),
                    onChanged: (value) => setState(() {
                          dropDownType = value!;
                        })))
          ]),
          TextButton(onPressed: () => saveChanges(), child: const Text('Save'))
        ]));
    ;
  }
}

 


// Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('Go back!'),
//           ),
//         )