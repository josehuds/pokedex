

import 'package:arqueprovaider/presenter/pokemon_provider.dart';
import 'package:arqueprovaider/model/pokemon_model.dart';
import 'package:arqueprovaider/view/detalhes_pokemon.dart';
import 'package:arqueprovaider/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> PokemonProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(
                title: 'pokemon',
              ),
          '/detalhes': (context) => Detalhes(pokemon: ModalRoute.of(context)!.settings.arguments as Pokemon),
        },
      ),
    );
  }
}