// screens/auth/register_screen.dart
import 'package:flutter/material.dart';
import 'package:pitstop/components/inputs/password-input.dart';
import 'package:pitstop/components/inputs/text-input.dart';
import 'package:pitstop/config/router.dart';
import 'package:pitstop/screens/auth/login_screen.dart';
import 'package:pitstop/screens/home/home_screen.dart';
import 'package:pitstop/screens/main_layout.dart';
import 'package:pitstop/services/auth.service.dart';
// ... alte importuri

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // bool success = await _authService.register(
        //   _nameController.text.trim(),
        //   _emailController.text.trim(),
        //   _passwordController.text,
        // );

        if (true) {
          // Navigare către HomePage și înlocuirea stack-ului de navigare
          AppRouter.navigateAndClearStack(context, '/login');
        }
        // } else {
        //   if (!mounted) return;
        //   // Afișarea unui mesaj de eroare
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Înregistrare eșuată. Încercați din nou.'),
        //       backgroundColor: Colors.red,
        //     ),
        //   );
        // }
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
    return MainLayout(
      title: 'Înregistrare',
      showBackButton: true, // Arată butonul de înapoi
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextInput(
              label: 'Nume',
              hint: 'Introduceți numele complet',
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduceți numele';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
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
                if (value == null || value.length < 6) {
                  return 'Parola trebuie să aibă cel puțin 6 caractere';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            PasswordInput(
              label: 'Confirmă parola',
              controller: _confirmPasswordController,
              validator: (value) {
                if (value != _passwordController.text) {
                  return 'Parolele nu corespund';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _register,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Înregistrare', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}