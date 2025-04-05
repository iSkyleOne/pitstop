// import 'package:flutter/material.dart';
// import 'package:pitstop/services/auth.service.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final _formKey = GlobalKey<FormState>();
//   final _currentPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _authService = AuthService();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _currentPasswordController.dispose();
//     _newPasswordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   Future<void> _changePassword() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _isLoading = true);

//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       final credential = EmailAuthProvider.credential(
//         email: user!.email!,
//         password: _currentPasswordController.text,
//       );
//       await user.reauthenticateWithCredential(credential);

//       await user.updatePassword(_newPasswordController.text);

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Parola a fost schimbată cu succes!')),
//         );
//         _currentPasswordController.clear();
//         _newPasswordController.clear();
//         _confirmPasswordController.clear();
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text(
//                   'Eroare la schimbarea parolei. Verifică parola curentă.')),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _authService.getCurrentUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData) {
//             return const Center(child: Text('Nu s-au putut încărca datele'));
//           }

//           final user = snapshot.data!;

//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     side: BorderSide(
//                       color: Theme.of(context).colorScheme.onSurface,
//                       width: 1,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Informații cont',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).colorScheme.onSurface,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         InfoRow(
//                           icon: Icons.person,
//                           label: 'Nume',
//                           value: user.displayName ?? 'N/A',
//                         ),
//                         const SizedBox(height: 8),
//                         InfoRow(
//                           icon: Icons.email,
//                           label: 'Email',
//                           value: user.email ?? 'N/A',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     side: BorderSide(
//                       color: Theme.of(context).colorScheme.onSurface,
//                       width: 1,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Schimbă parola',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           PasswordField(
//                             controller: _currentPasswordController,
//                             label: 'Parola curentă',
//                           ),
//                           const SizedBox(height: 8),
//                           PasswordField(
//                             controller: _newPasswordController,
//                             label: 'Parola nouă',
//                             validator: (value) {
//                               if (value != null && value.length < 6) {
//                                 return 'Parola trebuie să aibă cel puțin 6 caractere';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 8),
//                           PasswordField(
//                             controller: _confirmPasswordController,
//                             label: 'Confirmă parola nouă',
//                             validator: (value) {
//                               if (value != _newPasswordController.text) {
//                                 return 'Parolele nu coincid';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: _isLoading ? null : _changePassword,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Theme.of(context).cardColor,
//                                 side: BorderSide(
//                                   color:
//                                       Theme.of(context).colorScheme.onSurface,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: _isLoading
//                                   ? const SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                       ),
//                                     )
//                                   : const Text('Schimbă parola'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class InfoRow extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;

//   const InfoRow({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.value,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           icon,
//           size: 20,
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         const SizedBox(width: 8),
//         Text(
//           '$label:',
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             color: Theme.of(context).colorScheme.onSurface,
//           ),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             value,
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PasswordField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final String? Function(String?)? validator;

//   const PasswordField({
//     super.key,
//     required this.controller,
//     required this.label,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: true,
//       decoration: InputDecoration(
//         labelText: label,
//         border: const OutlineInputBorder(),
//       ),
//       validator: validator ??
//           (value) {
//             if (value == null || value.isEmpty) {
//               return 'Acest câmp este obligatoriu';
//             }
//             return null;
//           },
//     );
//   }
// }
