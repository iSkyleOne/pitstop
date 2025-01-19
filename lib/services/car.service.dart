// services/car_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pitstop/models/car.dart';

class CarService {
  final CollectionReference _carsCollection = FirebaseFirestore.instance.collection('cars');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addCar(Car car) async {
    await _carsCollection.add(car.toMap());
  }

  Stream<List<Car>> getCars() {
    final userId = _auth.currentUser?.uid;
    return _carsCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Car.fromMap(
                    doc.data() as Map<String, dynamic>,
                    doc.id,
                  ))
              .toList();
        });
  }

  Future<void> updateCar(String carId, Car car) async {
    await _carsCollection.doc(carId).update(car.toMap());
  }

  Future<void> deleteCar(String carId) async {
    await _carsCollection.doc(carId).delete();
  }
}