// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonParamsModelImpl _$$PokemonParamsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonParamsModelImpl(
      offset: (json['offset'] as num?)?.toInt() ?? 50,
      limit: (json['limit'] as num?)?.toInt() ?? 50,
    );

Map<String, dynamic> _$$PokemonParamsModelImplToJson(
        _$PokemonParamsModelImpl instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
    };
