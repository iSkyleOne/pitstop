import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(String email, String password, BuildContext context) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email sau parolă greșită!'),
        ),
      );
      return null;
    }
  }

  Future<UserCredential?> register({
    required String email,
    required String password,
    required String displayName,
    required BuildContext context
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(displayName);

      return userCredential;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A apărut o eroare!'),
        ),
      );
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    
    Navigator.pushReplacementNamed(context, '/login');
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}