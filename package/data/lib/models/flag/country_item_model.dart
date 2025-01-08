// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_item_model.freezed.dart';
part 'country_item_model.g.dart';

@freezed
class CountryItemModel with _$CountryItemModel {
  factory CountryItemModel({
    @JsonKey(name: "url_image") @Default('') String urlImage,
    @Default('') String id,
    @JsonKey(name: "country_name") @Default('') String countryName,
  }) = _CountryItemModel;
  factory CountryItemModel.fromJson(Map<String, dynamic> json) =>
      _$CountryItemModelFromJson(json);
}
