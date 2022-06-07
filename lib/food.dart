// ignore_for_file: constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:math';

import 'package:flutter/material.dart';

enum Type {
  All,
  Dairy,
  Seafood,
  Fruit,
}
enum state { red, green, yellow }

class Food {
  final String _name;
  final Type _foodtype;
  final state _foodstate;
  late final int _myid;
  static List<int> ids = [];
  Food(this._name, this._foodstate, this._foodtype) {
    var rand = Random();
    int test = rand.nextInt(2000);
    while (ids.contains(test)) test = rand.nextInt(2000);
    _myid = test;
  }

  Food.edit(this._name, this._foodstate, this._foodtype, this._myid) {
    ids.add(_myid);
  }

  String get getName => _name;
  Type get getType => _foodtype;
  state get getState => _foodstate;
  String get StringVar => '$_name,$_foodstate,$_foodtype,$getID';
  int get getID => _myid;
}

class CustomText extends StatelessWidget {
  final String _text;
  CustomText(this._text, {Key? key}) : super(key: key);
  static double _size = 1;
  static void increasesize() {
    _size += 0.1;
  }

  static void decreasesize() {
    _size -= 0.1;
  }

  @override
  Widget build(BuildContext context) {
    return Text(_text, textScaleFactor: _size);
  }
}
