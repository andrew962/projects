import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_params_model.freezed.dart';
part 'pokemon_params_model.g.dart';

@freezed
class PokemonParamsModel with _$PokemonParamsModel {
  factory PokemonParamsModel(
      {@Default(50) int offset, @Default(50) int limit}) = _PokemonParamsModel;
  factory PokemonParamsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonParamsModelFromJson(json);
}
