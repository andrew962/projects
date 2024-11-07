// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_game_item_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewGameItemResponseModel _$NewGameItemResponseModelFromJson(
    Map<String, dynamic> json) {
  return _NewGameItemResponseModel.fromJson(json);
}

/// @nodoc
mixin _$NewGameItemResponseModel {
  @JsonKey(name: "game_id")
  String get gameId => throw _privateConstructorUsedError;
  int get lives => throw _privateConstructorUsedError;
  List<dynamic> get questions => throw _privateConstructorUsedError;
  @JsonKey(name: "excluded_countries")
  List<dynamic> get excludedCountries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewGameItemResponseModelCopyWith<NewGameItemResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewGameItemResponseModelCopyWith<$Res> {
  factory $NewGameItemResponseModelCopyWith(NewGameItemResponseModel value,
          $Res Function(NewGameItemResponseModel) then) =
      _$NewGameItemResponseModelCopyWithImpl<$Res, NewGameItemResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "game_id") String gameId,
      int lives,
      List<dynamic> questions,
      @JsonKey(name: "excluded_countries") List<dynamic> excludedCountries});
}

/// @nodoc
class _$NewGameItemResponseModelCopyWithImpl<$Res,
        $Val extends NewGameItemResponseModel>
    implements $NewGameItemResponseModelCopyWith<$Res> {
  _$NewGameItemResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? lives = null,
    Object? questions = null,
    Object? excludedCountries = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      lives: null == lives
          ? _value.lives
          : lives // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      excludedCountries: null == excludedCountries
          ? _value.excludedCountries
          : excludedCountries // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewGameItemResponseModelImplCopyWith<$Res>
    implements $NewGameItemResponseModelCopyWith<$Res> {
  factory _$$NewGameItemResponseModelImplCopyWith(
          _$NewGameItemResponseModelImpl value,
          $Res Function(_$NewGameItemResponseModelImpl) then) =
      __$$NewGameItemResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "game_id") String gameId,
      int lives,
      List<dynamic> questions,
      @JsonKey(name: "excluded_countries") List<dynamic> excludedCountries});
}

/// @nodoc
class __$$NewGameItemResponseModelImplCopyWithImpl<$Res>
    extends _$NewGameItemResponseModelCopyWithImpl<$Res,
        _$NewGameItemResponseModelImpl>
    implements _$$NewGameItemResponseModelImplCopyWith<$Res> {
  __$$NewGameItemResponseModelImplCopyWithImpl(
      _$NewGameItemResponseModelImpl _value,
      $Res Function(_$NewGameItemResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? lives = null,
    Object? questions = null,
    Object? excludedCountries = null,
  }) {
    return _then(_$NewGameItemResponseModelImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      lives: null == lives
          ? _value.lives
          : lives // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      excludedCountries: null == excludedCountries
          ? _value._excludedCountries
          : excludedCountries // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewGameItemResponseModelImpl implements _NewGameItemResponseModel {
  _$NewGameItemResponseModelImpl(
      {@JsonKey(name: "game_id") this.gameId = '',
      this.lives = 5,
      final List<dynamic> questions = const [],
      @JsonKey(name: "excluded_countries")
      final List<dynamic> excludedCountries = const []})
      : _questions = questions,
        _excludedCountries = excludedCountries;

  factory _$NewGameItemResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewGameItemResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "game_id")
  final String gameId;
  @override
  @JsonKey()
  final int lives;
  final List<dynamic> _questions;
  @override
  @JsonKey()
  List<dynamic> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final List<dynamic> _excludedCountries;
  @override
  @JsonKey(name: "excluded_countries")
  List<dynamic> get excludedCountries {
    if (_excludedCountries is EqualUnmodifiableListView)
      return _excludedCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedCountries);
  }

  @override
  String toString() {
    return 'NewGameItemResponseModel(gameId: $gameId, lives: $lives, questions: $questions, excludedCountries: $excludedCountries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewGameItemResponseModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.lives, lives) || other.lives == lives) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality()
                .equals(other._excludedCountries, _excludedCountries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameId,
      lives,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_excludedCountries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewGameItemResponseModelImplCopyWith<_$NewGameItemResponseModelImpl>
      get copyWith => __$$NewGameItemResponseModelImplCopyWithImpl<
          _$NewGameItemResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewGameItemResponseModelImplToJson(
      this,
    );
  }
}

abstract class _NewGameItemResponseModel implements NewGameItemResponseModel {
  factory _NewGameItemResponseModel(
      {@JsonKey(name: "game_id") final String gameId,
      final int lives,
      final List<dynamic> questions,
      @JsonKey(name: "excluded_countries")
      final List<dynamic> excludedCountries}) = _$NewGameItemResponseModelImpl;

  factory _NewGameItemResponseModel.fromJson(Map<String, dynamic> json) =
      _$NewGameItemResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "game_id")
  String get gameId;
  @override
  int get lives;
  @override
  List<dynamic> get questions;
  @override
  @JsonKey(name: "excluded_countries")
  List<dynamic> get excludedCountries;
  @override
  @JsonKey(ignore: true)
  _$$NewGameItemResponseModelImplCopyWith<_$NewGameItemResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
