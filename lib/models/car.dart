class Car {
  final String? id;
  final String userId;
  final String vin;
  final String licensePlate;
  final DateTime itpExpiry;
  final DateTime rcaExpiry;
  final DateTime rovinietaExpiry;
  final String? brand;
  final String? model;
  final int? year;

  Car({
    this.id,
    required this.userId,
    required this.vin,
    required this.licensePlate,
    required this.itpExpiry,
    required this.rcaExpiry,
    required this.rovinietaExpiry,
    this.brand,
    this.model,
    this.year,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'vin': vin,
      'licensePlate': licensePlate,
      'itpExpiry': itpExpiry.toIso8601String(),
      'rcaExpiry': rcaExpiry.toIso8601String(),
      'rovinietaExpiry': rovinietaExpiry.toIso8601String(),
      'brand': brand,
      'model': model,
      'year': year,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map, String id) {
    return Car(
      id: id,
      userId: map['userId'],
      vin: map['vin'],
      licensePlate: map['licensePlate'],
      itpExpiry: DateTime.parse(map['itpExpiry']),
      rcaExpiry: DateTime.parse(map['rcaExpiry']),
      rovinietaExpiry: DateTime.parse(map['rovinietaExpiry']),
      brand: map['brand'],
      model: map['model'],
      year: map['year'],
    );
  }
}
