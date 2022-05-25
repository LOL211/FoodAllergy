import 'package:eatingblock/FileSetup.dart';
import 'package:eatingblock/addedit.dart';
import 'package:eatingblock/food.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Dem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Alternate());
  }
}

class Alternate extends StatelessWidget {
  const Alternate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hi'),
          actions: [
            IconButton(
                onPressed: () => FileSetup.writeToFileSingle(
                    Food('Cherry', state.green, Type.Fruit)),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: const MainPage());
  }
}
