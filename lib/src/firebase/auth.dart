
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {

  static final Auth _instance = Auth._();

  factory Auth() => _instance;

  Auth._();

  final _fireBaseAuth = FirebaseAuth.instance;

  User? get user => _fireBaseAuth.currentUser;

  Stream<User?> authStateChanges() => _fireBaseAuth.authStateChanges();

  Future<void> signOut() => _fireBaseAuth.signOut();

  Future<User?> signInAnonymously() async {
    final userCredential = await _fireBaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<User?> signInWithGoogle() async  {
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
  }
}