import 'package:data/models/models.dart';
import 'package:data/network/network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:get_it/get_it.dart';

void main() {
  Network network = Network(baseUrl: 'https://pokeapi.co/api/v2/');
  // Network network_instance = GetIt.instance<Network>();

  test("Test Network", () async {
    // var r = await network.get('');
    var r = await network.get('/pokemon');
    r.whenOrNull(
      ok: (data) {
        List<PokemonResponseModel> pokemonData = (data["results"] as List)
            .map((e) => PokemonResponseModel.fromJson(e))
            .toList();
        if (kDebugMode) {
          print("Pkemon $pokemonData");
        }
        expect(pokemonData.isNotEmpty, true);
      },
      err: (err) {
        if (kDebugMode) {
          print('Error $err');
        }
      },
    );
  });
}
