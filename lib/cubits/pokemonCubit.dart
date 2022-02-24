import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/api/controllers/pokemon_controller.dart';
import 'package:pokemon_test/api/models/pokemon_model.dart';

class PokemonCubit extends Cubit<PokemonModel> {
  PokemonCubit() : super(PokemonModel());

  void searchPokemon(String text) async {
    PokemonModel pokemonModel;
    try {
      pokemonModel = await PokemonController().searchGet(nameOrId: text);
    }
    catch (error) {
      pokemonModel = PokemonModel();
    }
    state.id = pokemonModel.id;
    state.name = pokemonModel.name;
    state.height = pokemonModel.height;
    state.weight = pokemonModel.weight;
    return emit(pokemonModel);
  }

  void randomPokemon() async {
    PokemonModel pokemonModel;
    try {
      pokemonModel = await PokemonController().randomGet();
    }
    catch (error) {
      pokemonModel = PokemonModel();
    }
    state.id = pokemonModel.id;
    state.name = pokemonModel.name;
    state.height = pokemonModel.height;
    state.weight = pokemonModel.weight;
    return emit(pokemonModel);
  }
}