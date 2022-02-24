import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/api/controllers/pokemon_controller.dart';
import 'package:pokemon_test/api/models/pokemon_model.dart';
import 'package:pokemon_test/components/custom_app_bar.dart';
import 'package:pokemon_test/cubits/pokemonCubit.dart';

class SearchPokemon extends StatelessWidget {
  SearchPokemon({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonCubit(),
      child: Material(
        child: Scaffold(
          appBar: customAppBar(name: 'Поиск покемона'),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<PokemonCubit, PokemonModel>(
              builder: (context, pokemon) => Column(
                children: [
                  TextField(
                    controller: searchController,
                    focusNode: searchFocus,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      hintText: 'Имя покемона',
                    ),
                    onEditingComplete: () {
                      context.read<PokemonCubit>().searchPokemon(searchController.text);
                      searchFocus.unfocus();
                    },
                  ),
                  Expanded(
                    child: pokemon.name != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Id покемона: ${pokemon.id}'),
                              Text('Имя покемона: ${pokemon.name}'),
                              Text('Рост покемона: ${pokemon.height}'),
                              Text('Вес покемона: ${pokemon.weight}'),
                            ],
                          )
                        : const Align(
                            alignment: Alignment.center,
                            child: Text('Покемон не найден'),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
