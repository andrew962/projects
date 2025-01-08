// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionResponseModelImpl _$$QuestionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionResponseModelImpl(
      correctAnswer: json['correct_answer'] == null
          ? null
          : CountryItemModel.fromJson(
              json['correct_answer'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => CountryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionResponseModelImplToJson(
        _$QuestionResponseModelImpl instance) =>
    <String, dynamic>{
      'correct_answer': instance.correctAnswer,
      'questions': instance.questions,
    };
