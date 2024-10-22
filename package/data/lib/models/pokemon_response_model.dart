import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_response_model.freezed.dart';
part 'pokemon_response_model.g.dart';

@Freezed(toJson: false)
class PokemonResponseModel with _$PokemonResponseModel {
  factory PokemonResponseModel({required String name, required String url}) =
      _PokemonResponseModel;

  factory PokemonResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseModelFromJson(json);
}
