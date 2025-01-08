// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionParamsModelImpl _$$QuestionParamsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionParamsModelImpl(
      excludeIDs: (json['excludeIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$QuestionParamsModelImplToJson(
        _$QuestionParamsModelImpl instance) =>
    <String, dynamic>{
      'excludeIDs': instance.excludeIDs,
    };
