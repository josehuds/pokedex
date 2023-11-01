// ignore_for_file: non_constant_identifier_names

import 'package:arqueprovaider/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonProvider extends ChangeNotifier {
  List<Pokemon> pokemons = [];

  Future<void> fetchPokemon() async {
    String url = 'https://rafaelbarbosatec.github.io/api/pokemon/pokemons.json';
    var uri = Uri.parse(url);

    var response = await http.get(uri);
    notifyListeners();
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      pokemons = json.map((e) {
        return Pokemon.fromJson(e);
      }).toList();
    } else {
      throw Exception('erro ao buscar dados: ${response.statusCode}');
    }
  }
}
