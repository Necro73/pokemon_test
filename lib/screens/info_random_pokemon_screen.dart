import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/api/models/pokemon_model.dart';
import 'package:pokemon_test/components/custom_app_bar.dart';
import 'package:pokemon_test/cubits/pokemonCubit.dart';

class InfoRandomPokemon extends StatelessWidget {
  const InfoRandomPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonCubit(),
      child: Material(
        child: Scaffold(
          appBar: customAppBar(name: 'Случайный покемон'),
          body: BlocBuilder<PokemonCubit, PokemonModel>(
            builder: (context, pokemon) => Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.black87),
                      child: TextButton(
                        child: const Text('Инфо о случайном покемоне'),
                        onPressed: () {
                          context.read<PokemonCubit>().randomPokemon();
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
