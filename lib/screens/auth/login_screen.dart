// screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:pitstop/components/inputs/password-input.dart';
import 'package:pitstop/components/inputs/text-input.dart';
import 'package:pitstop/config/router.dart';
import 'package:pitstop/screens/auth/register_screen.dart';
import 'package:pitstop/services/auth.service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    print("Apelare funcție de login");
    // Verifică dacă formularul este valid
    print(_formKey.currentState?.validate());

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      print("Email: ${_emailController.text.trim()}");
      print("Parola: ${_passwordController.text}");

      try {
        bool success = await _authService.login(
          _emailController.text.trim(),
          _passwordController.text,
        );

        print("Autentificare reușită: $success");

        if (success) {
          // Navigare către HomePage și înlocuirea stack-ului de navigare
          AppRouter.navigateAndClearStack(context, '/home');
        } else {
          if (!mounted) return;
          // Afișarea unui mesaj de eroare
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Autentificare eșuată. Verificați datele și încercați din nou.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Observă că nu folosim MainLayout aici pentru că
    // probabil dorim un UI diferit pentru pagina de login
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.lock,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 32),
                TextInput(
                  label: 'Email',
                  hint: 'Introduceți adresa de email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Introduceți o adresă de email validă';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  label: 'Parolă',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Introduceți parola';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Autentificare',
                          style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text('Nu ai cont? Înregistrează-te'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
