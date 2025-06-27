// ignore_for_file: invalid_annotation_target

import 'package:data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  factory QuestionModel({
    @JsonKey(name: "correct_answer") required FlagItemModel correctAnswer,
    @Default([]) @JsonKey(name: "options") List<FlagItemModel> options,
  }) = _QuestionModel;
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
