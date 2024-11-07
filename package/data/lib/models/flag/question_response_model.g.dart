// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionResponseModelImpl _$$QuestionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionResponseModelImpl(
      gameId: json['game_id'] as String,
      questionId: json['question_id'] as String,
      country:
          CountryItemModel.fromJson(json['country'] as Map<String, dynamic>),
      correctAnswer: json['correct_answer'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => CountryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionResponseModelImplToJson(
        _$QuestionResponseModelImpl instance) =>
    <String, dynamic>{
      'game_id': instance.gameId,
      'question_id': instance.questionId,
      'country': instance.country,
      'correct_answer': instance.correctAnswer,
      'answers': instance.answers,
    };
