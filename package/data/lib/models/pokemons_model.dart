import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemons_model.freezed.dart';
part 'pokemons_model.g.dart';

@Freezed()
class PokemonsModel with _$PokemonsModel {
  factory PokemonsModel({required String name, required String url}) =
      _PokemonsModel;

  factory PokemonsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonsModelFromJson(json);
}
