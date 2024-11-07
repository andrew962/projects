// ignore_for_file: invalid_annotation_target

import 'package:data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_response_model.freezed.dart';
part 'question_response_model.g.dart';

@freezed
class QuestionResponseModel with _$QuestionResponseModel {
  factory QuestionResponseModel({
    @JsonKey(name: "game_id") required String gameId,
    @JsonKey(name: "question_id") required String questionId,
    @JsonKey(name: "country") required CountryItemModel country,
    @JsonKey(name: "correct_answer") required String correctAnswer,
    @JsonKey(name: "answers") required List<CountryItemModel> answers,
  }) = _QuestionResponseModel;
  factory QuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseModelFromJson(json);
}
