// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_game_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewGameItemResponseModelImpl _$$NewGameItemResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NewGameItemResponseModelImpl(
      gameId: json['game_id'] as String? ?? '',
      lives: (json['lives'] as num?)?.toInt() ?? 5,
      questions: json['questions'] as List<dynamic>? ?? const [],
      excludedCountries:
          json['excluded_countries'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$NewGameItemResponseModelImplToJson(
        _$NewGameItemResponseModelImpl instance) =>
    <String, dynamic>{
      'game_id': instance.gameId,
      'lives': instance.lives,
      'questions': instance.questions,
      'excluded_countries': instance.excludedCountries,
    };
