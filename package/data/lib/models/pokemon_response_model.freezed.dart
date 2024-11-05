// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonResponseModel _$PokemonResponseModelFromJson(Map<String, dynamic> json) {
  return _PokemonResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonResponseModel {
  int get count => throw _privateConstructorUsedError;
  PokemontCountModel? get next => throw _privateConstructorUsedError;
  PokemontCountModel? get previous => throw _privateConstructorUsedError;
  List<PokemonsModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonResponseModelCopyWith<PokemonResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonResponseModelCopyWith<$Res> {
  factory $PokemonResponseModelCopyWith(PokemonResponseModel value,
          $Res Function(PokemonResponseModel) then) =
      _$PokemonResponseModelCopyWithImpl<$Res, PokemonResponseModel>;
  @useResult
  $Res call(
      {int count,
      PokemontCountModel? next,
      PokemontCountModel? previous,
      List<PokemonsModel> results});

  $PokemontCountModelCopyWith<$Res>? get next;
  $PokemontCountModelCopyWith<$Res>? get previous;
}

/// @nodoc
class _$PokemonResponseModelCopyWithImpl<$Res,
        $Val extends PokemonResponseModel>
    implements $PokemonResponseModelCopyWith<$Res> {
  _$PokemonResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as PokemontCountModel?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as PokemontCountModel?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonsModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemontCountModelCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $PokemontCountModelCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemontCountModelCopyWith<$Res>? get previous {
    if (_value.previous == null) {
      return null;
    }

    return $PokemontCountModelCopyWith<$Res>(_value.previous!, (value) {
      return _then(_value.copyWith(previous: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonResponseModelImplCopyWith<$Res>
    implements $PokemonResponseModelCopyWith<$Res> {
  factory _$$PokemonResponseModelImplCopyWith(_$PokemonResponseModelImpl value,
          $Res Function(_$PokemonResponseModelImpl) then) =
      __$$PokemonResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      PokemontCountModel? next,
      PokemontCountModel? previous,
      List<PokemonsModel> results});

  @override
  $PokemontCountModelCopyWith<$Res>? get next;
  @override
  $PokemontCountModelCopyWith<$Res>? get previous;
}

/// @nodoc
class __$$PokemonResponseModelImplCopyWithImpl<$Res>
    extends _$PokemonResponseModelCopyWithImpl<$Res, _$PokemonResponseModelImpl>
    implements _$$PokemonResponseModelImplCopyWith<$Res> {
  __$$PokemonResponseModelImplCopyWithImpl(_$PokemonResponseModelImpl _value,
      $Res Function(_$PokemonResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PokemonResponseModelImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as PokemontCountModel?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as PokemontCountModel?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonResponseModelImpl implements _PokemonResponseModel {
  _$PokemonResponseModelImpl(
      {this.count = 0, this.next, this.previous, this.results = const []});

  factory _$PokemonResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonResponseModelImplFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  final PokemontCountModel? next;
  @override
  final PokemontCountModel? previous;
  @override
  @JsonKey()
  final List<PokemonsModel> results;

  @override
  String toString() {
    return 'PokemonResponseModel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonResponseModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonResponseModelImplCopyWith<_$PokemonResponseModelImpl>
      get copyWith =>
          __$$PokemonResponseModelImplCopyWithImpl<_$PokemonResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonResponseModel implements PokemonResponseModel {
  factory _PokemonResponseModel(
      {final int count,
      final PokemontCountModel? next,
      final PokemontCountModel? previous,
      final List<PokemonsModel> results}) = _$PokemonResponseModelImpl;

  factory _PokemonResponseModel.fromJson(Map<String, dynamic> json) =
      _$PokemonResponseModelImpl.fromJson;

  @override
  int get count;
  @override
  PokemontCountModel? get next;
  @override
  PokemontCountModel? get previous;
  @override
  List<PokemonsModel> get results;
  @override
  @JsonKey(ignore: true)
  _$$PokemonResponseModelImplCopyWith<_$PokemonResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
