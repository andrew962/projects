// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryItemModelImpl _$$CountryItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CountryItemModelImpl(
      urlImage: json['url_image'] as String?,
      id: json['id'] as String,
      countryName: json['country_name'] as String,
    );

Map<String, dynamic> _$$CountryItemModelImplToJson(
        _$CountryItemModelImpl instance) =>
    <String, dynamic>{
      'url_image': instance.urlImage,
      'id': instance.id,
      'country_name': instance.countryName,
    };
