import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'poke_event.dart';
part 'poke_state.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  PokeBloc() : super(PokeState()) {
    on<PokeFetched>((event, emit) {
      print("Init Bloc");
      _getPokemon(PokemonParamsModel());
    });
  }

  _getPokemon(PokemonParamsModel params) async {
    PokeRepository pokeRepository = GetIt.instance<PokeRepository>();
    PokemonParamsModel params = PokemonParamsModel(limit: 100, offset: 50);
    var r = await pokeRepository.getPokemon(params);
    print(r);
  }
}
