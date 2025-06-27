// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flag_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlagItemModelImpl _$$FlagItemModelImplFromJson(Map<String, dynamic> json) =>
    _$FlagItemModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      urlImage: json['url_image'] as String? ?? '',
      countryName: json['country_name'] as String? ?? '',
      imageName: json['image_name'] as String? ?? '',
      showBadge: json['showBadge'] as bool? ?? false,
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$$FlagItemModelImplToJson(_$FlagItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url_image': instance.urlImage,
      'country_name': instance.countryName,
      'image_name': instance.imageName,
      'showBadge': instance.showBadge,
      'isCorrect': instance.isCorrect,
    };
