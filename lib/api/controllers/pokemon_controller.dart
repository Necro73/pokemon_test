import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pokemon_test/api/models/pokemon_model.dart';

class PokemonController {

  Future<PokemonModel> searchGet({required String nameOrId}) async {
    var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$nameOrId');
    return PokemonModel.parse(response.data);
  }

  Future<PokemonModel> randomGet() async {
    dynamic allList = await Dio().get('https://pokeapi.co/api/v2/pokemon/');
    var rng = Random();
    int randomValue = rng.nextInt(allList.data['count']);
    var response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$randomValue');
    return PokemonModel.parse(response.data);
  }
}