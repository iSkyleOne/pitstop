import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pitstop/main.dart';
import 'package:pitstop/models/car.dart';
import 'package:pitstop/screens/auth/login_screen.dart';
import 'package:pitstop/screens/auth/register_screen.dart';
import 'package:pitstop/screens/cars/add_edit_car.dart';
import 'package:pitstop/screens/cars/cars.dart';
import 'package:pitstop/screens/main_layout.dart';
import 'package:pitstop/screens/profile/profile_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final bool isLoggedIn = FirebaseAuth.instance.currentUser != null; 

    if (!isLoggedIn && settings.name != '/login' && settings.name != '/register') {
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(), 
      );
    }

    if (isLoggedIn && (settings.name == '/login' || settings.name == '/register')) {
      return MaterialPageRoute(
        builder: (_) => const MainLayout(title: 'PitStop', child: MyHomePage()), 
      );
    }

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainLayout(title: 'PitStop', child: MyHomePage()));
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const MainLayout(
          title: 'Profilul meu',
          child: ProfilePage(),
        ));
      case '/cars':
        return MaterialPageRoute(builder: (_) => const MainLayout(
          title: 'Masinile mele',
          child: CarsPage(),
        ));
      case '/add-car':
        return MaterialPageRoute(builder: (_) => const MainLayout(
          title: 'Adauga masina',
          showBackButton: true,
          child: AddEditCarPage(),
        ));
      case '/edit-car':
        return MaterialPageRoute(builder: (_) => MainLayout(
          title: 'Editeaza masina',
          showBackButton: true,
          child: AddEditCarPage(car: settings.arguments as Car),
        ));
      case '/home': 
        return MaterialPageRoute(builder: (_) => const MainLayout(title: 'PitStop', child: MyHomePage()));
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