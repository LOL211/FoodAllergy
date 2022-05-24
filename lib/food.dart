// ignore_for_file: constant_identifier_names

enum Type {
  All,
  Dairy,
  Seafood,
  Fruit,
}
enum state { red, green, yellow }

class Food {
  static int id = 0;
  final String _name;
  final Type _foodtype;
  final state _foodstate;
  late final int _myid;
  Food(this._name, this._foodstate, this._foodtype) {
    _myid = id;
    print(id.toString() + ' my id is ' + _myid.toString());
    id += 1;
  }

  Food.edit(this._name, this._foodstate, this._foodtype, this._myid);

  String get getName => _name;
  Type get getType => _foodtype;
  state get getState => _foodstate;
  String get StringVar => '$_name,$_foodstate,$_foodtype';
  int get getID => _myid;
}
