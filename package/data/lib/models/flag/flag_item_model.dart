// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'flag_item_model.freezed.dart';
part 'flag_item_model.g.dart';

@freezed
class FlagItemModel with _$FlagItemModel {
  factory FlagItemModel({
    @Default(0) int id,
    @JsonKey(name: "url_image") @Default('') String urlImage,
    @JsonKey(name: "country_name") @Default('') String countryName,
    @JsonKey(name: "image_name") @Default('') String imageName,
    @JsonKey(name: "showBadge") @Default(false) bool showBadge,
    @JsonKey(name: "isCorrect") @Default(false) bool isCorrect,
  }) = _FlagItemModel;
  factory FlagItemModel.fromJson(Map<String, dynamic> json) =>
      _$FlagItemModelFromJson(json);
}
