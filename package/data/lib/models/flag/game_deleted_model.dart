import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_deleted_model.freezed.dart';
part 'game_deleted_model.g.dart';

@freezed
class GameDeletedModel with _$GameDeletedModel {
  factory GameDeletedModel({@Default(false) bool success}) = _GameDeletedModel;
  factory GameDeletedModel.fromJson(Map<String, dynamic> json) =>
      _$GameDeletedModelFromJson(json);
}
