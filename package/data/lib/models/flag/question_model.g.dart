// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      correctAnswer: FlagItemModel.fromJson(
          json['correct_answer'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => FlagItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'correct_answer': instance.correctAnswer,
      'options': instance.options,
    };
