// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_game_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewGameResponseModel _$NewGameResponseModelFromJson(Map<String, dynamic> json) {
  return _NewGameResponseModel.fromJson(json);
}

/// @nodoc
mixin _$NewGameResponseModel {
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  NewGameItemResponseModel? get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewGameResponseModelCopyWith<NewGameResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewGameResponseModelCopyWith<$Res> {
  factory $NewGameResponseModelCopyWith(NewGameResponseModel value,
          $Res Function(NewGameResponseModel) then) =
      _$NewGameResponseModelCopyWithImpl<$Res, NewGameResponseModel>;
  @useResult
  $Res call({String? message, bool? success, NewGameItemResponseModel? item});

  $NewGameItemResponseModelCopyWith<$Res>? get item;
}

/// @nodoc
class _$NewGameResponseModelCopyWithImpl<$Res,
        $Val extends NewGameResponseModel>
    implements $NewGameResponseModelCopyWith<$Res> {
  _$NewGameResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as NewGameItemResponseModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewGameItemResponseModelCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $NewGameItemResponseModelCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewGameResponseModelImplCopyWith<$Res>
    implements $NewGameResponseModelCopyWith<$Res> {
  factory _$$NewGameResponseModelImplCopyWith(_$NewGameResponseModelImpl value,
          $Res Function(_$NewGameResponseModelImpl) then) =
      __$$NewGameResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool? success, NewGameItemResponseModel? item});

  @override
  $NewGameItemResponseModelCopyWith<$Res>? get item;
}

/// @nodoc
class __$$NewGameResponseModelImplCopyWithImpl<$Res>
    extends _$NewGameResponseModelCopyWithImpl<$Res, _$NewGameResponseModelImpl>
    implements _$$NewGameResponseModelImplCopyWith<$Res> {
  __$$NewGameResponseModelImplCopyWithImpl(_$NewGameResponseModelImpl _value,
      $Res Function(_$NewGameResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = freezed,
    Object? item = freezed,
  }) {
    return _then(_$NewGameResponseModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as NewGameItemResponseModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewGameResponseModelImpl implements _NewGameResponseModel {
  _$NewGameResponseModelImpl({this.message, this.success, this.item});

  factory _$NewGameResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewGameResponseModelImplFromJson(json);

  @override
  final String? message;
  @override
  final bool? success;
  @override
  final NewGameItemResponseModel? item;

  @override
  String toString() {
    return 'NewGameResponseModel(message: $message, success: $success, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewGameResponseModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, success, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewGameResponseModelImplCopyWith<_$NewGameResponseModelImpl>
      get copyWith =>
          __$$NewGameResponseModelImplCopyWithImpl<_$NewGameResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewGameResponseModelImplToJson(
      this,
    );
  }
}

abstract class _NewGameResponseModel implements NewGameResponseModel {
  factory _NewGameResponseModel(
      {final String? message,
      final bool? success,
      final NewGameItemResponseModel? item}) = _$NewGameResponseModelImpl;

  factory _NewGameResponseModel.fromJson(Map<String, dynamic> json) =
      _$NewGameResponseModelImpl.fromJson;

  @override
  String? get message;
  @override
  bool? get success;
  @override
  NewGameItemResponseModel? get item;
  @override
  @JsonKey(ignore: true)
  _$$NewGameResponseModelImplCopyWith<_$NewGameResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
