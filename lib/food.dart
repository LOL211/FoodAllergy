enum Type { dairy, seafood, fruit }
enum state { red, green, yellow }

class Food {
  final String _name;
  final Type _foodtype;
  final state _foodstate;

  Food(this._name, this._foodstate, this._foodtype);

  String get getName => _name;
  Type get getType => _foodtype;
  state get getState => _foodstate;
  String get StringVar => '$_name,$_foodstate,$_foodtype';
}
