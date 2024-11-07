// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_game_item_response_model.freezed.dart';
part 'new_game_item_response_model.g.dart';

@freezed
class NewGameItemResponseModel with _$NewGameItemResponseModel {
  factory NewGameItemResponseModel({
    @JsonKey(name: "game_id") @Default('') String gameId,
    @Default(5) int lives,
    @Default([]) List<dynamic> questions,
    @JsonKey(name: "excluded_countries")
    @Default([])
    List<dynamic> excludedCountries,
  }) = _NewGameItemResponseModel;
  factory NewGameItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewGameItemResponseModelFromJson(json);
}
