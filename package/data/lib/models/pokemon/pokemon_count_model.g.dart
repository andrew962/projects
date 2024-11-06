// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemontCountModelImpl _$$PokemontCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemontCountModelImpl(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PokemontCountModelImplToJson(
        _$PokemontCountModelImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };
