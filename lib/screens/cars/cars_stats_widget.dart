// import 'package:flutter/material.dart';
// import 'package:pitstop/models/car.dart';

// class CarStatsWidget extends StatelessWidget {
//   final List<Car> cars;

//   const CarStatsWidget({
//     super.key,
//     required this.cars,
//   });

//   int _getExpiredCount(
//       List<Car> cars, DateTime Function(Car car) getExpiryDate) {
//     final now = DateTime.now();
//     return cars.where((car) {
//       final expiryDate = getExpiryDate(car);
//       return expiryDate.isBefore(now);
//     }).length;
//   }

//   Widget _buildStatCard({
//     required BuildContext context,
//     required String title,
//     required int count,
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//   }) {
//     return Expanded(
//       child: Card(
//         elevation: 4,
//         color: backgroundColor,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(
//                 icon,
//                 size: 32,
//                 color: Colors.white,
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 count.toString(),
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).colorScheme.onSurface,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Theme.of(context).colorScheme.onSurface,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final expiredItp = _getExpiredCount(cars, (car) => car.itpExpiry);
//     final expiredRca = _getExpiredCount(cars, (car) => car.rcaExpiry);
//     final expiredRovinieta =
//         _getExpiredCount(cars, (car) => car.rovinietaExpiry);

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           _buildStatCard(
//             context: context,
//             title: 'ITP Expirat',
//             count: expiredItp,
//             icon: Icons.car_repair,
//             color: Colors.red,
//             backgroundColor:
//                 expiredItp > 0 ? Colors.red[500]! : Colors.green[500]!,
//           ),
//           const SizedBox(width: 8),
//           _buildStatCard(
//             context: context,
//             title: 'RCA Expirat',
//             count: expiredRca,
//             icon: Icons.document_scanner,
//             color: Colors.orange,
//             backgroundColor:
//                 expiredRca > 0 ? Colors.orange[500]! : Colors.green[500]!,
//           ),
//           const SizedBox(width: 8),
//           _buildStatCard(
//             context: context,
//             title: 'Fara Vinieta',
//             count: expiredRovinieta,
//             icon: Icons.receipt_long,
//             color: Colors.blue,
//             backgroundColor:
//                 expiredRovinieta > 0 ? Colors.blue[500]! : Colors.green[500]!,
//           ),
//         ],
//       ),
//     );
//   }
// }
