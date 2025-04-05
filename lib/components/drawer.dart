import 'package:flutter/material.dart';
import 'package:pitstop/config/router.dart';
import 'package:pitstop/services/auth.service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Icon(
                      Icons.car_repair,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Pitstop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Meniu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Bine ai revenit,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                // FutureBuilder<String>(
                //   future: authService.getCurrentUser(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData && snapshot.data != null) {
                //       return Text(
                //         snapshot.data!.displayName ?? 'Utilizator',
                //         style: const TextStyle(
                //           color: Colors.white,
                //           fontSize: 16,
                //         ),
                //       );
                //     }
                //     return const Text(
                //       'Utilizator',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 16,
                //       ),
                //     );
                //   },
                // ),
              ],
            )
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Acasă'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text('Masinile mele'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/cars');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Deconectare'),
            onTap: () async {
              final authService = AuthService();
              await authService.logout();
              AppRouter.navigateAndClearStack(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}