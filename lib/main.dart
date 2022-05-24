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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Hi'),
              actions: const [
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
            body: const MainPage()));
  }
}
