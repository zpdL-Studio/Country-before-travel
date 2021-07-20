import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../log.dart';
import '../../firebase/firestore.dart';
import '../../firebase/model/user/user_model.dart';

class AuthService extends GetxService {

  Future<AuthService> init() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Log.i('User is currently signed out!');
        authModel.value = null;
      } else {
        if(authModel.value == null) {
          try {
            await FireStoreCollections.USER.doc(user.uid).update(UserModelExtension.nowToAuthTime());
            authModel.value = await _getAuthModel(user);
            Log.i('AuthService : User is signed in! ${authModel.value}');
          } catch(e) {
            Log.e('AuthService : User is signed in UserModel error: $e');
          }
        }
      }
    });
    return this;
  }

  final _fireBaseAuth = FirebaseAuth.instance;

  final Rxn<AuthModel> authModel = Rxn<AuthModel>();

  bool isLogin() => _fireBaseAuth.currentUser != null;

  User? get user => _fireBaseAuth.currentUser;

  Future<AuthModel> _getAuthModel(User user) async {
    try {
      return AuthModel(
        user,
        UserModel.fromFireStore(
            await FireStoreCollections.USER.snapshot(user.uid)),
      );
    } catch(e) {
      Log.e('AuthService : _getAuthModel Error : $e');
      return AuthModel(user, null);
    }
  }

  Future<AuthModel?> signInWithGoogle() async {
    try {
      UserCredential? userCredential;

      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _fireBaseAuth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if(googleUser != null) {
          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
          final googleAuthCredential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          userCredential = await _fireBaseAuth.signInWithCredential(googleAuthCredential);
        }
      }

      return await _loginUserModelFor(userCredential?.user, UserAuthType.GOOGLE);
    } catch (e) {
      Log.e('AuthService : signInWithGoogle error : $e');
      rethrow;
    }
  }

  Future<AuthModel?> signInAnonymously() async {
    try {
      final userCredential = await _fireBaseAuth.signInAnonymously();
      return await _loginUserModelFor(userCredential.user, UserAuthType.ANONYMOUSLY);
    } catch (e) {
      Log.e('AuthService : _signInAnonymously error : $e');
      rethrow;
    }
  }

  Future<void> signOut() => _fireBaseAuth.signOut();

  Future<AuthModel?> _loginUserModelFor(User? user, UserAuthType userAuthType) async {
    if(user != null) {
      final doc = FireStoreCollections.USER.doc(user.uid);
      final snapshot = await doc.get();
      final userModel = UserModel(
          auth_type: userAuthType.value,
          auth_creation_time: user.metadata.creationTime,
          auth_sign_time: user.metadata.lastSignInTime,
          auth_time: DateTime.now(),
          platform: await _createUserPlatformModel());
      if (snapshot.exists) {
        await doc.update(userModel.toJson());
      } else {
        await doc.set(userModel.toJson());
      }

      return AuthModel(user, userModel);
    }
    return null;
  }

  Future<UserPlatformModel> _createUserPlatformModel() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (defaultTargetPlatform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return UserPlatformModel(
          platform: defaultTargetPlatform.toString(),
          model: androidInfo.model,
          identifier: androidInfo.androidId,
        );
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return UserPlatformModel(
          platform: defaultTargetPlatform.toString(),
          model: iosInfo.utsname.machine,
          identifier: iosInfo.identifierForVendor,
        );
      }
    } catch(_) {}

    return UserPlatformModel(platform: defaultTargetPlatform.toString());
  }
}

class AuthModel {
  final User user;
  final UserModel? userModel;

  AuthModel(this.user, this.userModel);

  @override
  String toString() {
    return 'AuthModel{user: $user, userModel: $userModel}';
  }
}