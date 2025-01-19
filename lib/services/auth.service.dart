import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login cu email și parolă
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

  // Register cu email și parolă
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

      // După ce contul e creat, actualizăm profilul cu numele
      await userCredential.user?.updateDisplayName(displayName);

      return userCredential;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A apărut o eroare!'),
        ),
      );
      return null;
    }
  }

  // Sign out
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/login');
  }

  // Verifică dacă userul e logat
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  // Returnează userul curent
  Future<User?> getCurrentUser() async {
    print(FirebaseAuth.instance.currentUser);
    return FirebaseAuth.instance.currentUser;
  }
}