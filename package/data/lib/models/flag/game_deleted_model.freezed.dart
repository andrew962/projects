// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_deleted_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameDeletedModel _$GameDeletedModelFromJson(Map<String, dynamic> json) {
  return _GameDeletedModel.fromJson(json);
}

/// @nodoc
mixin _$GameDeletedModel {
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDeletedModelCopyWith<GameDeletedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDeletedModelCopyWith<$Res> {
  factory $GameDeletedModelCopyWith(
          GameDeletedModel value, $Res Function(GameDeletedModel) then) =
      _$GameDeletedModelCopyWithImpl<$Res, GameDeletedModel>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$GameDeletedModelCopyWithImpl<$Res, $Val extends GameDeletedModel>
    implements $GameDeletedModelCopyWith<$Res> {
  _$GameDeletedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameDeletedModelImplCopyWith<$Res>
    implements $GameDeletedModelCopyWith<$Res> {
  factory _$$GameDeletedModelImplCopyWith(_$GameDeletedModelImpl value,
          $Res Function(_$GameDeletedModelImpl) then) =
      __$$GameDeletedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$GameDeletedModelImplCopyWithImpl<$Res>
    extends _$GameDeletedModelCopyWithImpl<$Res, _$GameDeletedModelImpl>
    implements _$$GameDeletedModelImplCopyWith<$Res> {
  __$$GameDeletedModelImplCopyWithImpl(_$GameDeletedModelImpl _value,
      $Res Function(_$GameDeletedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$GameDeletedModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameDeletedModelImpl implements _GameDeletedModel {
  _$GameDeletedModelImpl({this.success = false});

  factory _$GameDeletedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameDeletedModelImplFromJson(json);

  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'GameDeletedModel(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDeletedModelImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameDeletedModelImplCopyWith<_$GameDeletedModelImpl> get copyWith =>
      __$$GameDeletedModelImplCopyWithImpl<_$GameDeletedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameDeletedModelImplToJson(
      this,
    );
  }
}

abstract class _GameDeletedModel implements GameDeletedModel {
  factory _GameDeletedModel({final bool success}) = _$GameDeletedModelImpl;

  factory _GameDeletedModel.fromJson(Map<String, dynamic> json) =
      _$GameDeletedModelImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$GameDeletedModelImplCopyWith<_$GameDeletedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
