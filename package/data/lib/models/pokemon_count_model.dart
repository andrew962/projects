import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_count_model.freezed.dart';
part 'pokemon_count_model.g.dart';

@Freezed(toJson: true)
class PokemontCountModel with _$PokemontCountModel {
  factory PokemontCountModel({int? next, int? previous}) = _PokemontCountModel;
}
