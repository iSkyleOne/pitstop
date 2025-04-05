// lib/config/router.dart
import 'package:flutter/material.dart';
import 'package:pitstop/main.dart';
import 'package:pitstop/screens/auth/login_screen.dart';
import 'package:pitstop/screens/auth/register_screen.dart';
import 'package:pitstop/screens/main_layout.dart';
import 'package:pitstop/screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Rutele care nu necesită verificarea autentificării
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const MainLayout(title: 'PitStop', child: MyHomePage()),
        );
      
      // Adaugă celelalte rute aici
      
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Pagina nu a fost găsită!'),
            ),
          ),
        );
    }
  }

  // Helper pentru navigare cu parametri
  static void navigateTo(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  // Helper pentru înlocuirea stivei de navigare
  static void navigateToReplacement(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  // Helper pentru golirea stivei și navigare la o rută
  static void navigateAndClearStack(BuildContext context, String routeName) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }
}