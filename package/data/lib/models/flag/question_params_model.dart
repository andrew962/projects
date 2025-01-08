// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_params_model.freezed.dart';
part 'question_params_model.g.dart';

@freezed
class QuestionParamsModel with _$QuestionParamsModel {
  factory QuestionParamsModel(
          {@JsonKey(name: "excludeIDs") List<String>? excludeIDs}) =
      _QuestionParamsModel;
  factory QuestionParamsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionParamsModelFromJson(json);
}
