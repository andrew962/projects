// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_params_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonParamsModel _$PokemonParamsModelFromJson(Map<String, dynamic> json) {
  return _PokemonParamsModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonParamsModel {
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonParamsModelCopyWith<PokemonParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonParamsModelCopyWith<$Res> {
  factory $PokemonParamsModelCopyWith(
          PokemonParamsModel value, $Res Function(PokemonParamsModel) then) =
      _$PokemonParamsModelCopyWithImpl<$Res, PokemonParamsModel>;
  @useResult
  $Res call({int offset, int limit});
}

/// @nodoc
class _$PokemonParamsModelCopyWithImpl<$Res, $Val extends PokemonParamsModel>
    implements $PokemonParamsModelCopyWith<$Res> {
  _$PokemonParamsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonParamsModelImplCopyWith<$Res>
    implements $PokemonParamsModelCopyWith<$Res> {
  factory _$$PokemonParamsModelImplCopyWith(_$PokemonParamsModelImpl value,
          $Res Function(_$PokemonParamsModelImpl) then) =
      __$$PokemonParamsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int offset, int limit});
}

/// @nodoc
class __$$PokemonParamsModelImplCopyWithImpl<$Res>
    extends _$PokemonParamsModelCopyWithImpl<$Res, _$PokemonParamsModelImpl>
    implements _$$PokemonParamsModelImplCopyWith<$Res> {
  __$$PokemonParamsModelImplCopyWithImpl(_$PokemonParamsModelImpl _value,
      $Res Function(_$PokemonParamsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_$PokemonParamsModelImpl(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonParamsModelImpl implements _PokemonParamsModel {
  _$PokemonParamsModelImpl({this.offset = 50, this.limit = 50});

  factory _$PokemonParamsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonParamsModelImplFromJson(json);

  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'PokemonParamsModel(offset: $offset, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonParamsModelImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, offset, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonParamsModelImplCopyWith<_$PokemonParamsModelImpl> get copyWith =>
      __$$PokemonParamsModelImplCopyWithImpl<_$PokemonParamsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonParamsModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonParamsModel implements PokemonParamsModel {
  factory _PokemonParamsModel({final int offset, final int limit}) =
      _$PokemonParamsModelImpl;

  factory _PokemonParamsModel.fromJson(Map<String, dynamic> json) =
      _$PokemonParamsModelImpl.fromJson;

  @override
  int get offset;
  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$PokemonParamsModelImplCopyWith<_$PokemonParamsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
