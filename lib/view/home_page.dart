import 'package:arqueprovaider/presenter/pokemon_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    setState(() {
      context.read<PokemonProvider>().fetchPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Pokedex'),
        actions: <Widget>[
          ClipOval(
              child: Image.network(
            'https://thenounproject.com/api/private/icons/594337/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0',
            width: 60,
            height: 60,
          )),
        ],
      ),
      body: Consumer<PokemonProvider>(builder: (context, pokemonProvider, _) {
        return ListView.builder(
          itemCount: pokemonProvider.pokemons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  title: Text(pokemonProvider.pokemons[index].name ?? ''),
                  subtitle: Text(pokemonProvider.pokemons[index].name ?? ''),
                  trailing: Text('${pokemonProvider.pokemons[index].number}'),
                  leading: Image.network(
                      pokemonProvider.pokemons[index].thumbnailImage ?? ''
                      //'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/${listpokem[index].number}.png',
                      ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/detalhes',
                        arguments: pokemonProvider.pokemons[index]);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
