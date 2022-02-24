import 'package:flutter/material.dart';
import 'package:pokemon_test/components/custom_app_bar.dart';
import 'package:pokemon_test/screens/info_random_pokemon_screen.dart';
import 'package:pokemon_test/screens/search_pokemon_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: customAppBar(name: 'Меню'),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.black87
                  ),
                  child: TextButton(
                    child: const Text('Поиск покемона'),
                    onPressed: () {
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, __, ___) => SearchPokemon()));
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.black87
                  ),
                  child: TextButton(
                    child: const Text('Инфо о случайном покемоне'),
                    onPressed: () {
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, __, ___) => const InfoRandomPokemon()));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
