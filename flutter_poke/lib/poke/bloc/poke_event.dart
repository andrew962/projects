part of 'poke_bloc.dart';

@immutable
sealed class PokeEvent {}

final class PokeFetched extends PokeEvent {}
