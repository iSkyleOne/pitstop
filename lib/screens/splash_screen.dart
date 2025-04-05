// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:pitstop/config/router.dart';
import 'package:pitstop/services/auth.service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Adaugă un mic delay pentru a afișa splash screen
    await Future.delayed(const Duration(milliseconds: 1500));
    
    // Verifică autentificarea
    final bool isAuthenticated = await _authService.isAuthenticated();
    
    if (mounted) {
      // Navighează în funcție de starea de autentificare
      if (isAuthenticated) {
        AppRouter.navigateAndClearStack(context, '/home');
      } else {
        AppRouter.navigateAndClearStack(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Adaugă logo-ul tău aici
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 24),
            const Text(
              'PitStop',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}