// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseModelImpl<T> _$$ApiResponseModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseModelImpl<T>(
      message: json['message'] as String,
      success: json['success'] as bool,
      item: _$nullableGenericFromJson(json['item'], fromJsonT),
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApiResponseModelImplToJson<T>(
  _$ApiResponseModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'item': _$nullableGenericToJson(instance.item, toJsonT),
      'items': instance.items?.map(toJsonT).toList(),
      'count': instance.count,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
