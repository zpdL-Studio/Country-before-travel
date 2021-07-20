import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase_json_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserAuthType {
  ANONYMOUSLY,
  GOOGLE,
}

extension UserAuthTypeExtension on UserAuthType {
  String get value {
    switch(this) {
      case UserAuthType.ANONYMOUSLY:
        return 'ANONYMOUSLY';
      case UserAuthType.GOOGLE:
        return 'GOOGLE';
    }
  }
}

extension StringExtension on String {
  UserAuthType get userAuthType {
    for(final type in UserAuthType.values) {
      if(type.value == this) {
        return type;
      }
    }
    return UserAuthType.ANONYMOUSLY;
  }
}

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String auth_type,
    @timeStamp DateTime? auth_creation_time,
    @timeStamp DateTime? auth_sign_time,
    @timeStamp DateTime? auth_time,
    required UserPlatformModel platform,
  }) = _UserModel;

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return UserModel.fromJson(json);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

}

extension UserModelExtension on UserModel {
  UserAuthType get userAuthType => auth_type.userAuthType;

  static Map<String, dynamic> nowToAuthTime() {
    return {
      'auth_time': DateTime.now()
    };
  }
}

@freezed
class UserPlatformModel with _$UserPlatformModel {
  factory UserPlatformModel({
    required String platform,
    String? model,
    String? identifier,
  }) = _UserPlatformModel;

  factory UserPlatformModel.fromJson(Map<String, dynamic> json) => _$UserPlatformModelFromJson(json);
}