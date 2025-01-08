// ignore_for_file: invalid_annotation_target

import 'package:data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_response_model.freezed.dart';
part 'question_response_model.g.dart';

@freezed
class QuestionResponseModel with _$QuestionResponseModel {
  factory QuestionResponseModel({
    @JsonKey(name: "correct_answer") CountryItemModel? correctAnswer,
    @JsonKey(name: "questions") List<CountryItemModel>? questions,
  }) = _QuestionResponseModel;
  factory QuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseModelFromJson(json);
}
