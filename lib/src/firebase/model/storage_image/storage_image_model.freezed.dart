// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'storage_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StorageImageModel _$StorageImageModelFromJson(Map<String, dynamic> json) {
  return _StorageImageModel.fromJson(json);
}

/// @nodoc
class _$StorageImageModelTearOff {
  const _$StorageImageModelTearOff();

  _StorageImageModel call({required String path, required String url}) {
    return _StorageImageModel(
      path: path,
      url: url,
    );
  }

  StorageImageModel fromJson(Map<String, Object> json) {
    return StorageImageModel.fromJson(json);
  }
}

/// @nodoc
const $StorageImageModel = _$StorageImageModelTearOff();

/// @nodoc
mixin _$StorageImageModel {
  String get path => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageImageModelCopyWith<StorageImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageImageModelCopyWith<$Res> {
  factory $StorageImageModelCopyWith(
          StorageImageModel value, $Res Function(StorageImageModel) then) =
      _$StorageImageModelCopyWithImpl<$Res>;
  $Res call({String path, String url});
}

/// @nodoc
class _$StorageImageModelCopyWithImpl<$Res>
    implements $StorageImageModelCopyWith<$Res> {
  _$StorageImageModelCopyWithImpl(this._value, this._then);

  final StorageImageModel _value;
  // ignore: unused_field
  final $Res Function(StorageImageModel) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$StorageImageModelCopyWith<$Res>
    implements $StorageImageModelCopyWith<$Res> {
  factory _$StorageImageModelCopyWith(
          _StorageImageModel value, $Res Function(_StorageImageModel) then) =
      __$StorageImageModelCopyWithImpl<$Res>;
  @override
  $Res call({String path, String url});
}

/// @nodoc
class __$StorageImageModelCopyWithImpl<$Res>
    extends _$StorageImageModelCopyWithImpl<$Res>
    implements _$StorageImageModelCopyWith<$Res> {
  __$StorageImageModelCopyWithImpl(
      _StorageImageModel _value, $Res Function(_StorageImageModel) _then)
      : super(_value, (v) => _then(v as _StorageImageModel));

  @override
  _StorageImageModel get _value => super._value as _StorageImageModel;

  @override
  $Res call({
    Object? path = freezed,
    Object? url = freezed,
  }) {
    return _then(_StorageImageModel(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StorageImageModel implements _StorageImageModel {
  _$_StorageImageModel({required this.path, required this.url});

  factory _$_StorageImageModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StorageImageModelFromJson(json);

  @override
  final String path;
  @override
  final String url;

  @override
  String toString() {
    return 'StorageImageModel(path: $path, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorageImageModel &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$StorageImageModelCopyWith<_StorageImageModel> get copyWith =>
      __$StorageImageModelCopyWithImpl<_StorageImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StorageImageModelToJson(this);
  }
}

abstract class _StorageImageModel implements StorageImageModel {
  factory _StorageImageModel({required String path, required String url}) =
      _$_StorageImageModel;

  factory _StorageImageModel.fromJson(Map<String, dynamic> json) =
      _$_StorageImageModel.fromJson;

  @override
  String get path => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StorageImageModelCopyWith<_StorageImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
