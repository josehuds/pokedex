import 'package:arqueprovaider/model/pokemon_model.dart';

import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final Pokemon pokemon;

  const Detalhes({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(9),
                  child: Text(pokemon.number ?? ''),
                ),
                Image.network(pokemon.thumbnailImage ?? ''),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Text(
                    pokemon.description ?? '',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.all(9),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Type:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(9),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    pokemon.type?.join(', ') ?? '',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(9),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Weakness:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(9),
                    alignment: Alignment.bottomLeft,
                    child: Text(pokemon.weakness?.join(', ') ?? '')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
