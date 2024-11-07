import 'package:data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_game_response_model.freezed.dart';
part 'new_game_response_model.g.dart';

@freezed
class NewGameResponseModel with _$NewGameResponseModel {
  factory NewGameResponseModel({
    String? message,
    bool? success,
    NewGameItemResponseModel? item,
  }) = _NewGameResponseModel;
  factory NewGameResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewGameResponseModelFromJson(json);
}
