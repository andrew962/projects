import 'package:data/models/models.dart';
import 'package:data/network/network.dart';
import 'package:data/repositories/repository.dart';
import 'package:get_it/get_it.dart';

class PokeRepository implements Repository {
  @override
  Network network = GetIt.instance<Network>();

  Future<List<PokemonResponseModel>> getPokemon() async {
    var r = await network
        .get('/pokemon', queryParameters: {"offset": 50, "limit": 50});
    return r.maybeWhen(
      ok: (data) => (data["results"] as List)
          .map((e) => PokemonResponseModel.fromJson(e))
          .toList(),
      orElse: () {
        return [];
      },
    );
  }
}
