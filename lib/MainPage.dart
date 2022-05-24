// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'FileSetup.dart';
import 'FoodList.dart';
import 'food.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  setNameFilter(String fil) {
    setState(() {
      FileSetup.setNameFilter(fil);
    });
  }

  setTypeFilter(Type fil) {
    setState(() {
      dropDownType = fil;
      FileSetup.setTypeFilter(fil);
    });
  }

  setColorFilter(Color? value) {
    setState(() {
      dropDownIcon = value!;
      if (value == Colors.white)
        FileSetup.setStateFilter(null);
      else if (value == Colors.red)
        FileSetup.setStateFilter(state.red);
      else if (value == Colors.green)
        FileSetup.setStateFilter(state.green);
      else if (value == Colors.yellow) FileSetup.setStateFilter(state.yellow);
    });
  }

  Color dropDownIcon = Colors.white;
  Type dropDownType = Type.All;
  @override
  Widget build(BuildContext context) {
    //FileSetup.writeDefault();

    return Column(children: [
      Container(
          child: TextField(
            decoration: const InputDecoration(
                hintText: 'Search', icon: Icon(Icons.search)),
            onChanged: (text) => setNameFilter(text),
          ),
          padding: const EdgeInsets.all(8)),
      Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Text('Color'),
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                padding: const EdgeInsets.all(5),
                child: DropdownButton<Color>(
                  isDense: true,
                  value: dropDownIcon,
                  items: <Color>[
                    Colors.white,
                    Colors.red,
                    Colors.yellow,
                    Colors.green
                  ].map<DropdownMenuItem<Color>>((Color value) {
                    return DropdownMenuItem<Color>(
                        value: value,
                        alignment: Alignment.center,
                        child: Icon(Icons.brightness_1, color: value));
                  }).toList(),
                  onChanged: (value) => {setColorFilter(value)},
                )),
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
                  items: Type.values.map<DropdownMenuItem<Type>>((Type value) {
                    return DropdownMenuItem<Type>(
                        value: value,
                        child: Text(EnumToString.convertToString(value)));
                  }).toList(),
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (value) => setTypeFilter(value!),
                ))
          ]),
          padding: const EdgeInsets.all(10)),
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
