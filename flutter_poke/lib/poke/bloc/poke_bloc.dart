import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'poke_event.dart';
part 'poke_state.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  PokeBloc() : super(PokeInitial()) {
    on<PokeEvent>((event, emit) {});
  }
}
