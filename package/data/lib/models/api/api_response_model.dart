import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponseModel<T> with _$ApiResponseModel<T> {
  factory ApiResponseModel({
    required String message,
    required bool success,
    T? item,
    List<T>? items,
    int? count,
  }) = _ApiResponseModel;
  factory ApiResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseModelFromJson(json, fromJsonT);
}
