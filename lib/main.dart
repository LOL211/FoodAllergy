import 'package:eatingblock/addedit.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //FileSetup.clear();

    return MaterialApp(
        title: 'Flutter Dem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreenBody());
  }
}

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Food Allergies'),
          actions: [
            IconButton( 
                onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddEdit(null)))
                    .then((value) => setState(() {})),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
              // IconButton(
              //     onPressed: () => setState(() {
              //           CustomText.increasesize();
              //         }),
              //     icon: Icon(Icons.visibility)),
              // IconButton(
              //     onPressed: () => setState(() {
              //           CustomText.decreasesize();
              //         }),
              //     icon: Icon(Icons.visibility_off))
          ],
        ),
        // ignore: prefer_const_constructors
        body: MainPage());
  }
}

// class CustomText extends StatelessWidget {
//   final String _text;
//   CustomText(this._text, {Key? key}) : super(key: key);
//   static double _size = 10;
//   static void increasesize() {
//     _size += 10;
//     print(_size);
//   }

//   static void decreasesize() {
//     _size -= 1;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(_text, style: TextStyle(fontSize: _size));
//   }
// }
