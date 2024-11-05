import 'package:data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final pokemonFutureProvider =
    FutureProvider.family<PokemonResponseModel, PokemonParamsModel>(
        (ref, params) async {
  PokeRepository pokeRepository = GetIt.instance<PokeRepository>();
  PokemonParamsModel pokemonParams =
      PokemonParamsModel(limit: params.limit, offset: params.offset);

  return await pokeRepository.getPokemon(pokemonParams);
});
