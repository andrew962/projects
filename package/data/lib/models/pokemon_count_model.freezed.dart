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

/// @nodoc
mixin _$PokemontCountModel {
  int? get next => throw _privateConstructorUsedError;
  int? get previous => throw _privateConstructorUsedError;

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
  $Res call({int? next, int? previous});
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
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
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
  $Res call({int? next, int? previous});
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
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$PokemontCountModelImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$PokemontCountModelImpl implements _PokemontCountModel {
  _$PokemontCountModelImpl({this.next, this.previous});

  @override
  final int? next;
  @override
  final int? previous;

  @override
  String toString() {
    return 'PokemontCountModel(next: $next, previous: $previous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemontCountModelImpl &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, next, previous);

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
  factory _PokemontCountModel({final int? next, final int? previous}) =
      _$PokemontCountModelImpl;

  @override
  int? get next;
  @override
  int? get previous;
  @override
  @JsonKey(ignore: true)
  _$$PokemontCountModelImplCopyWith<_$PokemontCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
