class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;

  String get name => '$firstName $lastName';

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id']?.toString() ?? json['id']?.toString() ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };

    if (id.isNotEmpty) {
      data['_id'] = id;
    }

    if (phoneNumber != null) {
      data['phoneNumber'] = phoneNumber;
    }

    return data;
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    bool? active,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
