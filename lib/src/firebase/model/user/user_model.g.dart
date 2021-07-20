// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$_$_UserModelFromJson(Map<String, dynamic> json) {
  return _$_UserModel(
    auth_type: json['auth_type'] as String,
    auth_creation_time:
        timeStampFromJson(json['auth_creation_time'] as Timestamp?),
    auth_sign_time: timeStampFromJson(json['auth_sign_time'] as Timestamp?),
    auth_time: timeStampFromJson(json['auth_time'] as Timestamp?),
    platform:
        UserPlatformModel.fromJson(json['platform'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UserModelToJson(_$_UserModel instance) {
  final val = <String, dynamic>{
    'auth_type': instance.auth_type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'auth_creation_time', timeStampToJson(instance.auth_creation_time));
  writeNotNull('auth_sign_time', timeStampToJson(instance.auth_sign_time));
  writeNotNull('auth_time', timeStampToJson(instance.auth_time));
  val['platform'] = instance.platform.toJson();
  return val;
}

_$_UserPlatformModel _$_$_UserPlatformModelFromJson(Map<String, dynamic> json) {
  return _$_UserPlatformModel(
    platform: json['platform'] as String,
    model: json['model'] as String?,
    identifier: json['identifier'] as String?,
  );
}

Map<String, dynamic> _$_$_UserPlatformModelToJson(
    _$_UserPlatformModel instance) {
  final val = <String, dynamic>{
    'platform': instance.platform,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('model', instance.model);
  writeNotNull('identifier', instance.identifier);
  return val;
}
