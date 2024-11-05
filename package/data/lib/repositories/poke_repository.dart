import 'package:data/models/models.dart';
import 'package:data/network/network.dart';
import 'package:data/repositories/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:equatable/equatable.dart';

class PokeRepository implements Repository {
  @override
  Network network = GetIt.instance<Network>();

  Future<PokemonResponseModel> getPokemon(PokemonParamsModel params) async {
    var r = await network.get('/pokemon', queryParameters: params.toJson());
    return r.maybeWhen(
      ok: (data) {
        List<PokemonsModel> results = (data["results"] as List)
            .map((e) => PokemonsModel.fromJson(e))
            .toList();
        PokemontCount pokemontCount = PokemontCount(data: data);
        PokemontCountModel? next = pokemontCount.next();
        PokemontCountModel? previous = pokemontCount.previous();
        return PokemonResponseModel(
            count: data["count"],
            next: next,
            previous: previous,
            results: results);
      },
      orElse: () {
        return PokemonResponseModel();
      },
    );
  }
}

class PokemontCount extends Equatable {
  const PokemontCount({required this.data});

  final dynamic data;

  @override
  List<Object?> get props => [data];

  PokemontCountModel next() {
    String? dataNext = data["next"];
    var limit = int.tryParse(dataNext != null
        ? dataNext.substring(dataNext.indexOf("=") + 1, dataNext.indexOf("&"))
        : '0');
    var offset = int.tryParse(dataNext != null
        ? dataNext.substring(dataNext.indexOf("=") + 1, dataNext.length)
        : '0');
    return PokemontCountModel(limit: limit, offset: offset);
  }

  PokemontCountModel previous() {
    String? dataPrevious = data["previous"];
    var limit = int.tryParse(dataPrevious != null
        ? dataPrevious.substring(
            dataPrevious.indexOf("=") + 1, dataPrevious.indexOf("&"))
        : '0');
    var offset = int.tryParse(dataPrevious != null
        ? dataPrevious.substring(
            dataPrevious.indexOf("=") + 1, dataPrevious.length)
        : '0');
    return PokemontCountModel(limit: limit, offset: offset);
  }
}
