// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:pitstop/models/car.dart';
// import 'package:pitstop/services/car.service.dart';

// class CarCard extends StatelessWidget {
//   final Car car;

//   const CarCard({super.key, required this.car});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4),
//         side: BorderSide(
//           color: Theme.of(context).colorScheme.onSurface,
//           width: 1,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '${car.brand} ${car.model}',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 PopupMenuButton(
//                   itemBuilder: (context) => [
//                     const PopupMenuItem(
//                       value: 'edit',
//                       child: Text('Editează'),
//                     ),
//                     const PopupMenuItem(
//                       value: 'delete',
//                       child: Text('Șterge'),
//                     ),
//                   ],
//                   onSelected: (value) {
//                     if (value == 'edit') {
//                       Navigator.pushNamed(
//                         context,
//                         '/edit-car',
//                         arguments: car,
//                       );
//                     } else if (value == 'delete') {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Confirmare'),
//                           content: const Text(
//                               'Ești sigur că vrei să ștergi această mașină?'),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text('Anulează'),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 CarService().deleteCar(car.id!);
//                                 Navigator.pop(context);
//                               },
//                               child: const Text('Șterge'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text('Nr. înmatriculare: ${car.licensePlate}'),
//             Text('VIN: ${car.vin}'),
//             const SizedBox(height: 8),
//             ExpiryInfo(
//               label: 'ITP',
//               date: car.itpExpiry,
//             ),
//             ExpiryInfo(
//               label: 'RCA',
//               date: car.rcaExpiry,
//             ),
//             ExpiryInfo(
//               label: 'Rovinietă',
//               date: car.rovinietaExpiry,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ExpiryInfo extends StatelessWidget {
//   final String label;
//   final DateTime date;

//   const ExpiryInfo({
//     super.key,
//     required this.label,
//     required this.date,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final daysUntilExpiry = date.difference(DateTime.now()).inDays;
//     final isExpired = daysUntilExpiry < 0;

//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('$label: ${DateFormat('dd.MM.yyyy').format(date)}'),
//           const SizedBox(width: 8),
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8,
//               vertical: 4,
//             ),
//             decoration: BoxDecoration(
//               color: isExpired
//                   ? Colors.red
//                   : daysUntilExpiry <= 30
//                       ? Colors.orange
//                       : Colors.green,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               isExpired ? 'Expirat' : 'Expira în $daysUntilExpiry zile',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
