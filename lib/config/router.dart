import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pitstop/main.dart';
import 'package:pitstop/screens/auth/login_screen.dart';
import 'package:pitstop/screens/auth/register_screen.dart';
import 'package:pitstop/screens/profile/profile_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Verifică dacă userul e logat
    final bool isLoggedIn = FirebaseAuth.instance.currentUser != null; // sau metoda ta de verificare

    if (!isLoggedIn && settings.name != '/login' && settings.name != '/register') {
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(), // sau pagina ta de login
      );
    }

    // Previne accesarea login/register când userul e logat
    if (isLoggedIn && (settings.name == '/login' || settings.name == '/register')) {
      return MaterialPageRoute(
        builder: (_) => const MyHomePage(title: 'test',), // sau pagina ta principală
      );
    }

    // Handle-ul normal pentru rute
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'test'));
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'test'));
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found!'),
            ),
          ),
        );
    }
  }
}