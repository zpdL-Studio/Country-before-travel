// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'google_place_photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GooglePlacePhotoModel _$GooglePlacePhotoModelFromJson(
    Map<String, dynamic> json) {
  return _GooglePlacePhotoModel.fromJson(json);
}

/// @nodoc
class _$GooglePlacePhotoModelTearOff {
  const _$GooglePlacePhotoModelTearOff();

  _GooglePlacePhotoModel call(
      {required String photoReference,
      required int width,
      required int height}) {
    return _GooglePlacePhotoModel(
      photoReference: photoReference,
      width: width,
      height: height,
    );
  }

  GooglePlacePhotoModel fromJson(Map<String, Object> json) {
    return GooglePlacePhotoModel.fromJson(json);
  }
}

/// @nodoc
const $GooglePlacePhotoModel = _$GooglePlacePhotoModelTearOff();

/// @nodoc
mixin _$GooglePlacePhotoModel {
  String get photoReference => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GooglePlacePhotoModelCopyWith<GooglePlacePhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GooglePlacePhotoModelCopyWith<$Res> {
  factory $GooglePlacePhotoModelCopyWith(GooglePlacePhotoModel value,
          $Res Function(GooglePlacePhotoModel) then) =
      _$GooglePlacePhotoModelCopyWithImpl<$Res>;
  $Res call({String photoReference, int width, int height});
}

/// @nodoc
class _$GooglePlacePhotoModelCopyWithImpl<$Res>
    implements $GooglePlacePhotoModelCopyWith<$Res> {
  _$GooglePlacePhotoModelCopyWithImpl(this._value, this._then);

  final GooglePlacePhotoModel _value;
  // ignore: unused_field
  final $Res Function(GooglePlacePhotoModel) _then;

  @override
  $Res call({
    Object? photoReference = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      photoReference: photoReference == freezed
          ? _value.photoReference
          : photoReference // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GooglePlacePhotoModelCopyWith<$Res>
    implements $GooglePlacePhotoModelCopyWith<$Res> {
  factory _$GooglePlacePhotoModelCopyWith(_GooglePlacePhotoModel value,
          $Res Function(_GooglePlacePhotoModel) then) =
      __$GooglePlacePhotoModelCopyWithImpl<$Res>;
  @override
  $Res call({String photoReference, int width, int height});
}

/// @nodoc
class __$GooglePlacePhotoModelCopyWithImpl<$Res>
    extends _$GooglePlacePhotoModelCopyWithImpl<$Res>
    implements _$GooglePlacePhotoModelCopyWith<$Res> {
  __$GooglePlacePhotoModelCopyWithImpl(_GooglePlacePhotoModel _value,
      $Res Function(_GooglePlacePhotoModel) _then)
      : super(_value, (v) => _then(v as _GooglePlacePhotoModel));

  @override
  _GooglePlacePhotoModel get _value => super._value as _GooglePlacePhotoModel;

  @override
  $Res call({
    Object? photoReference = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_GooglePlacePhotoModel(
      photoReference: photoReference == freezed
          ? _value.photoReference
          : photoReference // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GooglePlacePhotoModel implements _GooglePlacePhotoModel {
  _$_GooglePlacePhotoModel(
      {required this.photoReference,
      required this.width,
      required this.height});

  factory _$_GooglePlacePhotoModel.fromJson(Map<String, dynamic> json) =>
      _$_$_GooglePlacePhotoModelFromJson(json);

  @override
  final String photoReference;
  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'GooglePlacePhotoModel(photoReference: $photoReference, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GooglePlacePhotoModel &&
            (identical(other.photoReference, photoReference) ||
                const DeepCollectionEquality()
                    .equals(other.photoReference, photoReference)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(photoReference) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height);

  @JsonKey(ignore: true)
  @override
  _$GooglePlacePhotoModelCopyWith<_GooglePlacePhotoModel> get copyWith =>
      __$GooglePlacePhotoModelCopyWithImpl<_GooglePlacePhotoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GooglePlacePhotoModelToJson(this);
  }
}

abstract class _GooglePlacePhotoModel implements GooglePlacePhotoModel {
  factory _GooglePlacePhotoModel(
      {required String photoReference,
      required int width,
      required int height}) = _$_GooglePlacePhotoModel;

  factory _GooglePlacePhotoModel.fromJson(Map<String, dynamic> json) =
      _$_GooglePlacePhotoModel.fromJson;

  @override
  String get photoReference => throw _privateConstructorUsedError;
  @override
  int get width => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GooglePlacePhotoModelCopyWith<_GooglePlacePhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
