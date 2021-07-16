import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../log.dart';

class AuthService extends GetxService {

  Future<AuthService> init() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    return this;
  }

  final _fireBaseAuth = FirebaseAuth.instance;

  bool isLogin() => _fireBaseAuth.currentUser != null;

  User? get user => _fireBaseAuth.currentUser;

  Future<User?> signInWithGoogle() async {
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

      return userCredential?.user;
    } catch (e) {
      Log.e('signInWithGoogle error : $e');
      rethrow;
    }
  }

  Future<User?> signInAnonymously() async {
    try {
      final userCredential = await _fireBaseAuth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      Log.e('_signInAnonymously error : $e');
      rethrow;
    }
  }
}