// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flag_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlagItemModel _$FlagItemModelFromJson(Map<String, dynamic> json) {
  return _FlagItemModel.fromJson(json);
}

/// @nodoc
mixin _$FlagItemModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "url_image")
  String get urlImage => throw _privateConstructorUsedError;
  @JsonKey(name: "country_name")
  String get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: "image_name")
  String get imageName => throw _privateConstructorUsedError;
  @JsonKey(name: "showBadge")
  bool get showBadge => throw _privateConstructorUsedError;
  @JsonKey(name: "isCorrect")
  bool get isCorrect => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlagItemModelCopyWith<FlagItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlagItemModelCopyWith<$Res> {
  factory $FlagItemModelCopyWith(
          FlagItemModel value, $Res Function(FlagItemModel) then) =
      _$FlagItemModelCopyWithImpl<$Res, FlagItemModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "url_image") String urlImage,
      @JsonKey(name: "country_name") String countryName,
      @JsonKey(name: "image_name") String imageName,
      @JsonKey(name: "showBadge") bool showBadge,
      @JsonKey(name: "isCorrect") bool isCorrect});
}

/// @nodoc
class _$FlagItemModelCopyWithImpl<$Res, $Val extends FlagItemModel>
    implements $FlagItemModelCopyWith<$Res> {
  _$FlagItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? urlImage = null,
    Object? countryName = null,
    Object? imageName = null,
    Object? showBadge = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      showBadge: null == showBadge
          ? _value.showBadge
          : showBadge // ignore: cast_nullable_to_non_nullable
              as bool,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlagItemModelImplCopyWith<$Res>
    implements $FlagItemModelCopyWith<$Res> {
  factory _$$FlagItemModelImplCopyWith(
          _$FlagItemModelImpl value, $Res Function(_$FlagItemModelImpl) then) =
      __$$FlagItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "url_image") String urlImage,
      @JsonKey(name: "country_name") String countryName,
      @JsonKey(name: "image_name") String imageName,
      @JsonKey(name: "showBadge") bool showBadge,
      @JsonKey(name: "isCorrect") bool isCorrect});
}

/// @nodoc
class __$$FlagItemModelImplCopyWithImpl<$Res>
    extends _$FlagItemModelCopyWithImpl<$Res, _$FlagItemModelImpl>
    implements _$$FlagItemModelImplCopyWith<$Res> {
  __$$FlagItemModelImplCopyWithImpl(
      _$FlagItemModelImpl _value, $Res Function(_$FlagItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? urlImage = null,
    Object? countryName = null,
    Object? imageName = null,
    Object? showBadge = null,
    Object? isCorrect = null,
  }) {
    return _then(_$FlagItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      urlImage: null == urlImage
          ? _value.urlImage
          : urlImage // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      showBadge: null == showBadge
          ? _value.showBadge
          : showBadge // ignore: cast_nullable_to_non_nullable
              as bool,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlagItemModelImpl implements _FlagItemModel {
  _$FlagItemModelImpl(
      {this.id = 0,
      @JsonKey(name: "url_image") this.urlImage = '',
      @JsonKey(name: "country_name") this.countryName = '',
      @JsonKey(name: "image_name") this.imageName = '',
      @JsonKey(name: "showBadge") this.showBadge = false,
      @JsonKey(name: "isCorrect") this.isCorrect = false});

  factory _$FlagItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlagItemModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: "url_image")
  final String urlImage;
  @override
  @JsonKey(name: "country_name")
  final String countryName;
  @override
  @JsonKey(name: "image_name")
  final String imageName;
  @override
  @JsonKey(name: "showBadge")
  final bool showBadge;
  @override
  @JsonKey(name: "isCorrect")
  final bool isCorrect;

  @override
  String toString() {
    return 'FlagItemModel(id: $id, urlImage: $urlImage, countryName: $countryName, imageName: $imageName, showBadge: $showBadge, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlagItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.urlImage, urlImage) ||
                other.urlImage == urlImage) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName) &&
            (identical(other.showBadge, showBadge) ||
                other.showBadge == showBadge) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, urlImage, countryName, imageName, showBadge, isCorrect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlagItemModelImplCopyWith<_$FlagItemModelImpl> get copyWith =>
      __$$FlagItemModelImplCopyWithImpl<_$FlagItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlagItemModelImplToJson(
      this,
    );
  }
}

abstract class _FlagItemModel implements FlagItemModel {
  factory _FlagItemModel(
      {final int id,
      @JsonKey(name: "url_image") final String urlImage,
      @JsonKey(name: "country_name") final String countryName,
      @JsonKey(name: "image_name") final String imageName,
      @JsonKey(name: "showBadge") final bool showBadge,
      @JsonKey(name: "isCorrect") final bool isCorrect}) = _$FlagItemModelImpl;

  factory _FlagItemModel.fromJson(Map<String, dynamic> json) =
      _$FlagItemModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "url_image")
  String get urlImage;
  @override
  @JsonKey(name: "country_name")
  String get countryName;
  @override
  @JsonKey(name: "image_name")
  String get imageName;
  @override
  @JsonKey(name: "showBadge")
  bool get showBadge;
  @override
  @JsonKey(name: "isCorrect")
  bool get isCorrect;
  @override
  @JsonKey(ignore: true)
  _$$FlagItemModelImplCopyWith<_$FlagItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
