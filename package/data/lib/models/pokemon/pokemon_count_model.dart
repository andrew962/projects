import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_count_model.freezed.dart';
part 'pokemon_count_model.g.dart';

@freezed
class PokemontCountModel with _$PokemontCountModel {
  factory PokemontCountModel({int? limit, int? offset}) = _PokemontCountModel;
  factory PokemontCountModel.fromJson(Map<String, dynamic> json) =>
      _$PokemontCountModelFromJson(json);
}
