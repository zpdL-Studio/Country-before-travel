// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {required String auth_type,
      @timeStamp DateTime? auth_creation_time,
      @timeStamp DateTime? auth_sign_time,
      @timeStamp DateTime? auth_time,
      required UserPlatformModel platform}) {
    return _UserModel(
      auth_type: auth_type,
      auth_creation_time: auth_creation_time,
      auth_sign_time: auth_sign_time,
      auth_time: auth_time,
      platform: platform,
    );
  }

  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String get auth_type => throw _privateConstructorUsedError;
  @timeStamp
  DateTime? get auth_creation_time => throw _privateConstructorUsedError;
  @timeStamp
  DateTime? get auth_sign_time => throw _privateConstructorUsedError;
  @timeStamp
  DateTime? get auth_time => throw _privateConstructorUsedError;
  UserPlatformModel get platform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String auth_type,
      @timeStamp DateTime? auth_creation_time,
      @timeStamp DateTime? auth_sign_time,
      @timeStamp DateTime? auth_time,
      UserPlatformModel platform});

  $UserPlatformModelCopyWith<$Res> get platform;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? auth_type = freezed,
    Object? auth_creation_time = freezed,
    Object? auth_sign_time = freezed,
    Object? auth_time = freezed,
    Object? platform = freezed,
  }) {
    return _then(_value.copyWith(
      auth_type: auth_type == freezed
          ? _value.auth_type
          : auth_type // ignore: cast_nullable_to_non_nullable
              as String,
      auth_creation_time: auth_creation_time == freezed
          ? _value.auth_creation_time
          : auth_creation_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      auth_sign_time: auth_sign_time == freezed
          ? _value.auth_sign_time
          : auth_sign_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      auth_time: auth_time == freezed
          ? _value.auth_time
          : auth_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as UserPlatformModel,
    ));
  }

  @override
  $UserPlatformModelCopyWith<$Res> get platform {
    return $UserPlatformModelCopyWith<$Res>(_value.platform, (value) {
      return _then(_value.copyWith(platform: value));
    });
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String auth_type,
      @timeStamp DateTime? auth_creation_time,
      @timeStamp DateTime? auth_sign_time,
      @timeStamp DateTime? auth_time,
      UserPlatformModel platform});

  @override
  $UserPlatformModelCopyWith<$Res> get platform;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? auth_type = freezed,
    Object? auth_creation_time = freezed,
    Object? auth_sign_time = freezed,
    Object? auth_time = freezed,
    Object? platform = freezed,
  }) {
    return _then(_UserModel(
      auth_type: auth_type == freezed
          ? _value.auth_type
          : auth_type // ignore: cast_nullable_to_non_nullable
              as String,
      auth_creation_time: auth_creation_time == freezed
          ? _value.auth_creation_time
          : auth_creation_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      auth_sign_time: auth_sign_time == freezed
          ? _value.auth_sign_time
          : auth_sign_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      auth_time: auth_time == freezed
          ? _value.auth_time
          : auth_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as UserPlatformModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {required this.auth_type,
      @timeStamp this.auth_creation_time,
      @timeStamp this.auth_sign_time,
      @timeStamp this.auth_time,
      required this.platform});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  final String auth_type;
  @override
  @timeStamp
  final DateTime? auth_creation_time;
  @override
  @timeStamp
  final DateTime? auth_sign_time;
  @override
  @timeStamp
  final DateTime? auth_time;
  @override
  final UserPlatformModel platform;

  @override
  String toString() {
    return 'UserModel(auth_type: $auth_type, auth_creation_time: $auth_creation_time, auth_sign_time: $auth_sign_time, auth_time: $auth_time, platform: $platform)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.auth_type, auth_type) ||
                const DeepCollectionEquality()
                    .equals(other.auth_type, auth_type)) &&
            (identical(other.auth_creation_time, auth_creation_time) ||
                const DeepCollectionEquality()
                    .equals(other.auth_creation_time, auth_creation_time)) &&
            (identical(other.auth_sign_time, auth_sign_time) ||
                const DeepCollectionEquality()
                    .equals(other.auth_sign_time, auth_sign_time)) &&
            (identical(other.auth_time, auth_time) ||
                const DeepCollectionEquality()
                    .equals(other.auth_time, auth_time)) &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(auth_type) ^
      const DeepCollectionEquality().hash(auth_creation_time) ^
      const DeepCollectionEquality().hash(auth_sign_time) ^
      const DeepCollectionEquality().hash(auth_time) ^
      const DeepCollectionEquality().hash(platform);

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required String auth_type,
      @timeStamp DateTime? auth_creation_time,
      @timeStamp DateTime? auth_sign_time,
      @timeStamp DateTime? auth_time,
      required UserPlatformModel platform}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get auth_type => throw _privateConstructorUsedError;
  @override
  @timeStamp
  DateTime? get auth_creation_time => throw _privateConstructorUsedError;
  @override
  @timeStamp
  DateTime? get auth_sign_time => throw _privateConstructorUsedError;
  @override
  @timeStamp
  DateTime? get auth_time => throw _privateConstructorUsedError;
  @override
  UserPlatformModel get platform => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPlatformModel _$UserPlatformModelFromJson(Map<String, dynamic> json) {
  return _UserPlatformModel.fromJson(json);
}

/// @nodoc
class _$UserPlatformModelTearOff {
  const _$UserPlatformModelTearOff();

  _UserPlatformModel call(
      {required String platform, String? model, String? identifier}) {
    return _UserPlatformModel(
      platform: platform,
      model: model,
      identifier: identifier,
    );
  }

  UserPlatformModel fromJson(Map<String, Object> json) {
    return UserPlatformModel.fromJson(json);
  }
}

/// @nodoc
const $UserPlatformModel = _$UserPlatformModelTearOff();

/// @nodoc
mixin _$UserPlatformModel {
  String get platform => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPlatformModelCopyWith<UserPlatformModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlatformModelCopyWith<$Res> {
  factory $UserPlatformModelCopyWith(
          UserPlatformModel value, $Res Function(UserPlatformModel) then) =
      _$UserPlatformModelCopyWithImpl<$Res>;
  $Res call({String platform, String? model, String? identifier});
}

/// @nodoc
class _$UserPlatformModelCopyWithImpl<$Res>
    implements $UserPlatformModelCopyWith<$Res> {
  _$UserPlatformModelCopyWithImpl(this._value, this._then);

  final UserPlatformModel _value;
  // ignore: unused_field
  final $Res Function(UserPlatformModel) _then;

  @override
  $Res call({
    Object? platform = freezed,
    Object? model = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserPlatformModelCopyWith<$Res>
    implements $UserPlatformModelCopyWith<$Res> {
  factory _$UserPlatformModelCopyWith(
          _UserPlatformModel value, $Res Function(_UserPlatformModel) then) =
      __$UserPlatformModelCopyWithImpl<$Res>;
  @override
  $Res call({String platform, String? model, String? identifier});
}

/// @nodoc
class __$UserPlatformModelCopyWithImpl<$Res>
    extends _$UserPlatformModelCopyWithImpl<$Res>
    implements _$UserPlatformModelCopyWith<$Res> {
  __$UserPlatformModelCopyWithImpl(
      _UserPlatformModel _value, $Res Function(_UserPlatformModel) _then)
      : super(_value, (v) => _then(v as _UserPlatformModel));

  @override
  _UserPlatformModel get _value => super._value as _UserPlatformModel;

  @override
  $Res call({
    Object? platform = freezed,
    Object? model = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_UserPlatformModel(
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPlatformModel implements _UserPlatformModel {
  _$_UserPlatformModel({required this.platform, this.model, this.identifier});

  factory _$_UserPlatformModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserPlatformModelFromJson(json);

  @override
  final String platform;
  @override
  final String? model;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'UserPlatformModel(platform: $platform, model: $model, identifier: $identifier)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserPlatformModel &&
            (identical(other.platform, platform) ||
                const DeepCollectionEquality()
                    .equals(other.platform, platform)) &&
            (identical(other.model, model) ||
                const DeepCollectionEquality().equals(other.model, model)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(platform) ^
      const DeepCollectionEquality().hash(model) ^
      const DeepCollectionEquality().hash(identifier);

  @JsonKey(ignore: true)
  @override
  _$UserPlatformModelCopyWith<_UserPlatformModel> get copyWith =>
      __$UserPlatformModelCopyWithImpl<_UserPlatformModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserPlatformModelToJson(this);
  }
}

abstract class _UserPlatformModel implements UserPlatformModel {
  factory _UserPlatformModel(
      {required String platform,
      String? model,
      String? identifier}) = _$_UserPlatformModel;

  factory _UserPlatformModel.fromJson(Map<String, dynamic> json) =
      _$_UserPlatformModel.fromJson;

  @override
  String get platform => throw _privateConstructorUsedError;
  @override
  String? get model => throw _privateConstructorUsedError;
  @override
  String? get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserPlatformModelCopyWith<_UserPlatformModel> get copyWith =>
      throw _privateConstructorUsedError;
}
