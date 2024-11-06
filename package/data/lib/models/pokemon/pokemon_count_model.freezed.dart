// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemontCountModel _$PokemontCountModelFromJson(Map<String, dynamic> json) {
  return _PokemontCountModel.fromJson(json);
}

/// @nodoc
mixin _$PokemontCountModel {
  int? get limit => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemontCountModelCopyWith<PokemontCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemontCountModelCopyWith<$Res> {
  factory $PokemontCountModelCopyWith(
          PokemontCountModel value, $Res Function(PokemontCountModel) then) =
      _$PokemontCountModelCopyWithImpl<$Res, PokemontCountModel>;
  @useResult
  $Res call({int? limit, int? offset});
}

/// @nodoc
class _$PokemontCountModelCopyWithImpl<$Res, $Val extends PokemontCountModel>
    implements $PokemontCountModelCopyWith<$Res> {
  _$PokemontCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_value.copyWith(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemontCountModelImplCopyWith<$Res>
    implements $PokemontCountModelCopyWith<$Res> {
  factory _$$PokemontCountModelImplCopyWith(_$PokemontCountModelImpl value,
          $Res Function(_$PokemontCountModelImpl) then) =
      __$$PokemontCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? limit, int? offset});
}

/// @nodoc
class __$$PokemontCountModelImplCopyWithImpl<$Res>
    extends _$PokemontCountModelCopyWithImpl<$Res, _$PokemontCountModelImpl>
    implements _$$PokemontCountModelImplCopyWith<$Res> {
  __$$PokemontCountModelImplCopyWithImpl(_$PokemontCountModelImpl _value,
      $Res Function(_$PokemontCountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$PokemontCountModelImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemontCountModelImpl implements _PokemontCountModel {
  _$PokemontCountModelImpl({this.limit, this.offset});

  factory _$PokemontCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemontCountModelImplFromJson(json);

  @override
  final int? limit;
  @override
  final int? offset;

  @override
  String toString() {
    return 'PokemontCountModel(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemontCountModelImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemontCountModelImplCopyWith<_$PokemontCountModelImpl> get copyWith =>
      __$$PokemontCountModelImplCopyWithImpl<_$PokemontCountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemontCountModelImplToJson(
      this,
    );
  }
}

abstract class _PokemontCountModel implements PokemontCountModel {
  factory _PokemontCountModel({final int? limit, final int? offset}) =
      _$PokemontCountModelImpl;

  factory _PokemontCountModel.fromJson(Map<String, dynamic> json) =
      _$PokemontCountModelImpl.fromJson;

  @override
  int? get limit;
  @override
  int? get offset;
  @override
  @JsonKey(ignore: true)
  _$$PokemontCountModelImplCopyWith<_$PokemontCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
