// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_game_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewGameResponseModelImpl _$$NewGameResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NewGameResponseModelImpl(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      item: json['item'] == null
          ? null
          : NewGameItemResponseModel.fromJson(
              json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewGameResponseModelImplToJson(
        _$NewGameResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'item': instance.item,
    };
