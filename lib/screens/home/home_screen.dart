// screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:pitstop/screens/main_layout.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return MainLayout(
        title: 'Acasă',
        child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                ),
                const SizedBox(height: 24),
                const Text(
                    'Bine ai venit în aplicație!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                onPressed: () {
                    // Acțiune pentru butonul principal
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                    ),
                ),
                child: const Text('Continuă'),
                ),
            ],
            ),
        ),
        );
    }
}
