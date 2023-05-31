import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:macro_tracker/auth/auth_manager.dart';
import 'package:macro_tracker/backend/backend.dart';
import 'package:macro_tracker/auth/firebase_auth/email_auth.dart';
import 'package:macro_tracker/auth/firebase_auth/firebase_user_provider.dart';

import 'auth_util.dart';

export 'package:macro_tracker/auth/base_auth_user_provider.dart';

class FirebaseAuthManager extends AuthManager with EmailSignInManager {
  // Set when using phone verification (after phone number is provided).
  // Set when using phone sign in in web mode (ignored otherwise).

  @override
  Future signOut() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future deleteUser(BuildContext context) async {
    try {
      if (!loggedIn) {
        print('Error: delete user attempted with no logged in user!');
        return;
      }
      await currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Too long since most recent sign in. Sign in again before deleting your account.')),
        );
      }
    }
  }

  Future modifyUser(
      BuildContext context, String mail, String name, String surname) async {
    try {
      if (!loggedIn) {
        print('Error: delete user attempted with no logged in user!');
        return;
      }

      FirebaseAuth.instance.currentUser!.updateEmail(mail);

      print("Email: $mail, name: $name, surname: $surname");
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserDocument?.uid)
          .update({
        'email': mail,
        'name': name,
        'surname': surname,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message!}')),
      );
      return null;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password reset email sent')),
    );
  }

  @override
  Future<BaseAuthUser?> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        context,
        () => emailSignInFunc(email, password),
        'EMAIL',
      );

  @override
  Future<BaseAuthUser?> createAccountWithEmail(
    BuildContext context,
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        context,
        () => emailCreateAccountFunc(email, password),
        'EMAIL',
      );

  /// Tries to sign in or create an account using Firebase Auth.
  /// Returns the User object if sign in was successful.
  Future<BaseAuthUser?> _signInOrCreateAccount(
    BuildContext context,
    Future<UserCredential?> Function() signInFunc,
    String authProvider,
  ) async {
    try {
      final userCredential = await signInFunc();
      if (userCredential?.user != null) {
        await maybeCreateUser(userCredential!.user!);
      }
      return userCredential == null
          ? null
          : MacroTrackerFirebaseUser.fromUserCredential(userCredential);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message!}')),
      );
      return null;
    }
  }
}
