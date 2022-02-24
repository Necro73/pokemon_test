class PokemonModel {
  int? id;
  String? name;
  int? height;
  int? weight;

  static PokemonModel parse(dynamic data) {
    var result = PokemonModel();
    result.id = data['id'];
    result.name = data['name'];
    result.height = data['height'];
    result.weight = data['weight'];
    return result;
  }
}