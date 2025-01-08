// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_params_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionParamsModel _$QuestionParamsModelFromJson(Map<String, dynamic> json) {
  return _QuestionParamsModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionParamsModel {
  @JsonKey(name: "excludeIDs")
  List<String>? get excludeIDs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionParamsModelCopyWith<QuestionParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionParamsModelCopyWith<$Res> {
  factory $QuestionParamsModelCopyWith(
          QuestionParamsModel value, $Res Function(QuestionParamsModel) then) =
      _$QuestionParamsModelCopyWithImpl<$Res, QuestionParamsModel>;
  @useResult
  $Res call({@JsonKey(name: "excludeIDs") List<String>? excludeIDs});
}

/// @nodoc
class _$QuestionParamsModelCopyWithImpl<$Res, $Val extends QuestionParamsModel>
    implements $QuestionParamsModelCopyWith<$Res> {
  _$QuestionParamsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? excludeIDs = freezed,
  }) {
    return _then(_value.copyWith(
      excludeIDs: freezed == excludeIDs
          ? _value.excludeIDs
          : excludeIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionParamsModelImplCopyWith<$Res>
    implements $QuestionParamsModelCopyWith<$Res> {
  factory _$$QuestionParamsModelImplCopyWith(_$QuestionParamsModelImpl value,
          $Res Function(_$QuestionParamsModelImpl) then) =
      __$$QuestionParamsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "excludeIDs") List<String>? excludeIDs});
}

/// @nodoc
class __$$QuestionParamsModelImplCopyWithImpl<$Res>
    extends _$QuestionParamsModelCopyWithImpl<$Res, _$QuestionParamsModelImpl>
    implements _$$QuestionParamsModelImplCopyWith<$Res> {
  __$$QuestionParamsModelImplCopyWithImpl(_$QuestionParamsModelImpl _value,
      $Res Function(_$QuestionParamsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? excludeIDs = freezed,
  }) {
    return _then(_$QuestionParamsModelImpl(
      excludeIDs: freezed == excludeIDs
          ? _value._excludeIDs
          : excludeIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionParamsModelImpl implements _QuestionParamsModel {
  _$QuestionParamsModelImpl(
      {@JsonKey(name: "excludeIDs") final List<String>? excludeIDs})
      : _excludeIDs = excludeIDs;

  factory _$QuestionParamsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionParamsModelImplFromJson(json);

  final List<String>? _excludeIDs;
  @override
  @JsonKey(name: "excludeIDs")
  List<String>? get excludeIDs {
    final value = _excludeIDs;
    if (value == null) return null;
    if (_excludeIDs is EqualUnmodifiableListView) return _excludeIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuestionParamsModel(excludeIDs: $excludeIDs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionParamsModelImpl &&
            const DeepCollectionEquality()
                .equals(other._excludeIDs, _excludeIDs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_excludeIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionParamsModelImplCopyWith<_$QuestionParamsModelImpl> get copyWith =>
      __$$QuestionParamsModelImplCopyWithImpl<_$QuestionParamsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionParamsModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionParamsModel implements QuestionParamsModel {
  factory _QuestionParamsModel(
          {@JsonKey(name: "excludeIDs") final List<String>? excludeIDs}) =
      _$QuestionParamsModelImpl;

  factory _QuestionParamsModel.fromJson(Map<String, dynamic> json) =
      _$QuestionParamsModelImpl.fromJson;

  @override
  @JsonKey(name: "excludeIDs")
  List<String>? get excludeIDs;
  @override
  @JsonKey(ignore: true)
  _$$QuestionParamsModelImplCopyWith<_$QuestionParamsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
