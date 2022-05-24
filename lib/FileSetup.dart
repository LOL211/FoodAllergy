import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'food.dart';

class FileSetup {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/foodlist.txt');
  }

  static void writeDefault() async {
    final file = await _localFile;

    // Write the file
    List<Food> lis = [];
    lis.add(Food('berry', state.red, Type.dairy));
    lis.add(Food('fish', state.green, Type.seafood));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    lis.add(Food('apple', state.yellow, Type.fruit));
    file.writeAsStringSync('');

    for (Food ele in lis) {
      file.writeAsStringSync(ele.StringVar + '\n', mode: FileMode.append);
    }
  }

  static state? statefil;
  static String namefil = '';
  static Type? typefil;

  static setStateFilter(state? fil) {
    statefil = fil;
  }

  static setNameFilter(String fil) {
    namefil = fil;
  }

  static setTypeFilter(Type? fil) {
    typefil = fil;
  }

  static Future<List<Food>> readFile() async {
    final file = await _localFile;

    List<String> lis = file.readAsLinesSync();
    List<Food> foodlist = [];
    for (String element in lis) {
      List<String> spl = element.split(',');
      foodlist.add(Food(
          spl[0],
          state.values.firstWhere((e) => e.toString() == spl[1]),
          Type.values.firstWhere((e) => e.toString() == spl[2])));
    }

    if (namefil != '') {
      foodlist.removeWhere((element) => !element.getName.contains(namefil));
    }
    if (statefil != null) {
      foodlist.removeWhere((element) => element.getState != statefil);
    }
    if (typefil != null) {
      foodlist.removeWhere((element) => element.getType != typefil);
    }

    return foodlist;
  }
}
