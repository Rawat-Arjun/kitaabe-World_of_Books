import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String rememberKey = 'rememberMe';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // GOOGLE LOGIN
  Future<User?> signInWithGoogle({bool rememberMe = false}) async {
    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.disconnect();
      }
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      if (rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(rememberKey, true);
      }
      return userCredential.user;
    } catch (e) {
      log('Google Sign-In Error: $e');
      return null;
    }
  }

  // EMAIL SIGN-IN
  Future<User?> signInWithEmailAndPassword(String email, String password,
      {bool rememberMe = false}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(rememberKey, true);
      }
      return userCredential.user;
    } catch (e) {
      log('Email Sign-In Error: $e');
      return null;
    }
  }

  // EMAIL SIGN-UP
  Future<User?> signUpWithEmailAndPassword(String email, String password,
      {bool rememberMe = false}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(rememberKey, true);
      }
      return userCredential.user;
    } catch (e) {
      log('Email Sign-Up Error: $e');
      return null;
    }
  }

  // LOGOUT
  Future<void> signOutWithGoogle() async {
    try {
      await _googleSignIn
          .signOut(); // Use signOut instead of disconnect to avoid errors
    } catch (_) {}
    await _auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(rememberKey);
  }

  User? getCurrentUser() => _auth.currentUser;

  Future<bool> shouldRememberUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(rememberKey) ?? false;
  }

  Future forgotPasswordRequest(String email) async {
    try {
      // send mail for resetting password
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log('Forgot Password Error : $e');
    }
  }
}
